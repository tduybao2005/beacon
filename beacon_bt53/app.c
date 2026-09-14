/**
 * Beacon E104-BT53A1 (EBYTE, Silicon Labs EFR32BG22) cho he chi duong benh vien.
 * Port tu ban E73 (Nordic nRF52840 / Adafruit Bluefruit) - giu nguyen hanh vi:
 *
 *  - Binh thuong: PHAT quang ba connectable 5 lan/giay (interval 200ms).
 *    Radio tu mo cua so nghe ngay sau moi goi phat de nhan yeu cau ket noi
 *    (chuan BLE, stack lo) -> dien thoai luon ket noi duoc de nap code/ghi ID.
 *  - Khi co ket noi BLE (OTA DFU hoac ghi config): stack tu NGUNG PHAT,
 *    beacon chi nhan du lieu. Ngat ket noi -> tu ve phat 5 lan/giay.
 *  - Khong co vong quet (scanner): quet chi de nghe quang ba cua thiet bi khac,
 *    khong phuc vu tinh nang nao ma ngon pin.
 *
 * ID phan cap (benh vien / toa / khoa / tang / stt) phat trong Manufacturer
 * Specific Data, company ID 0x0059, payload 13 byte - GIU Y NGUYEN dinh dang
 * cua ban E73 de app doc beacon khong phai sua gi:
 *   [0] magic 0xE7 | [1] version 0x01 | [2-5] hospitalCode u32 BE
 *   [6] buildingCode u8 | [7] deptCode u8 | [8] floorCode i8
 *   [9-10] idx u16 BE | [11] txPower i8 (@1m) | [12] battery u8 (0xFF = n/a)
 *
 * Gan/sua ID qua BLE khong can cam day: ghi 13 byte payload vao characteristic
 * E7300002-..., luu vao NVM3, ap dung ngay khi ngat ket noi.
 */

#include <string.h>
#include <stdio.h>
#include "sl_bt_api.h"
#include "sl_main_init.h"
#include "app_assert.h"
#include "app.h"
#include "gatt_db.h"
#include "nvm3_default.h"

#define E73_MAGIC          0xE7
#define E73_VERSION        0x01
#define E73_PAYLOAD_LEN    13
#define E73_COMPANY_ID     0x0059

// 320 * 0.625ms = 200ms -> 5 quang ba/giay (giong het ban E73)
#define ADV_INTERVAL_UNITS 320

// Don vi 0.1 dBm: 40 = +4.0 dBm (bang muc cua ban E73)
#define TX_POWER_MAX_DDBM  40
#define TX_POWER_MIN_DDBM  (-300)

#define NVM3_KEY_CONFIG    0x0001

static uint8_t advertising_set_handle = 0xff;

// Payload hien hanh (mac dinh: chua gan - hospital 0, toa 0, khoa 0, tang 0, stt 0)
static uint8_t payload[E73_PAYLOAD_LEN] = {
  E73_MAGIC, E73_VERSION,
  0x00, 0x00, 0x00, 0x00,  // hospitalCode
  0x00,                    // buildingCode
  0x00,                    // deptCode
  0x00,                    // floorCode
  0x00, 0x00,              // idx
  // txPower @1m: do thuc te tren chinh module nay (TX +4dBm) bang Redmi Note 9S
  // o ~1m -> trung vi -69 dBm tren 370 mau. Gia tri cu -59 la mac dinh chung cua
  // iBeacon, chua tung do; lech 10 dB lam app tinh khoang cach gap ~3,2 lan.
  (uint8_t)(-69),
  0xFF                     // battery khong ro
};

static char device_name[48];
static bool connected = false;
static bool config_dirty = false;

static void load_config(void)
{
  uint8_t buf[E73_PAYLOAD_LEN];
  Ecode_t err = nvm3_readData(nvm3_defaultHandle, NVM3_KEY_CONFIG, buf, sizeof(buf));
  if ((err == ECODE_NVM3_OK)
      && (buf[0] == E73_MAGIC)
      && (buf[1] == E73_VERSION)) {
    memcpy(payload, buf, E73_PAYLOAD_LEN);
  }
}

static void save_config(void)
{
  (void)nvm3_writeData(nvm3_defaultHandle, NVM3_KEY_CONFIG, payload, E73_PAYLOAD_LEN);
}

static void build_device_name(void)
{
  uint32_t hosp = ((uint32_t)payload[2] << 24) | ((uint32_t)payload[3] << 16)
                  | ((uint32_t)payload[4] << 8) | (uint32_t)payload[5];
  uint16_t idx = (uint16_t)(((uint16_t)payload[9] << 8) | payload[10]);
  snprintf(device_name, sizeof(device_name), "E73-%lu-B%02u-K%02u-F%02d-%04u",
           (unsigned long)hosp,
           (unsigned int)payload[6],
           (unsigned int)payload[7],
           (int)(int8_t)payload[8],
           (unsigned int)idx);
}

static void setup_advertising(void)
{
  sl_status_t sc;
  uint8_t adv_data[31];
  uint8_t sr_data[31];
  uint8_t len = 0;

  // AD: Flags - LE General Discoverable, BR/EDR not supported
  adv_data[len++] = 2;
  adv_data[len++] = 0x01;
  adv_data[len++] = 0x06;

  // AD: Manufacturer Specific Data = company ID (little endian) + 13 byte payload
  adv_data[len++] = 1 + 2 + E73_PAYLOAD_LEN;
  adv_data[len++] = 0xFF;
  adv_data[len++] = (uint8_t)(E73_COMPANY_ID & 0xFF);
  adv_data[len++] = (uint8_t)((E73_COMPANY_ID >> 8) & 0xFF);
  memcpy(&adv_data[len], payload, E73_PAYLOAD_LEN);
  len = (uint8_t)(len + E73_PAYLOAD_LEN);

  build_device_name();
  uint8_t name_len = (uint8_t)strlen(device_name);
  if (name_len > 29) {
    name_len = 29;
  }
  sr_data[0] = (uint8_t)(name_len + 1);
  sr_data[1] = 0x09;  // Complete Local Name
  memcpy(&sr_data[2], device_name, name_len);

  sc = sl_bt_legacy_advertiser_set_data(advertising_set_handle,
                                        sl_bt_advertiser_advertising_data_packet,
                                        len, adv_data);
  app_assert_status(sc);

  sc = sl_bt_legacy_advertiser_set_data(advertising_set_handle,
                                        sl_bt_advertiser_scan_response_packet,
                                        (uint8_t)(name_len + 2), sr_data);
  app_assert_status(sc);

  sc = sl_bt_gatt_server_write_attribute_value(gattdb_device_name, 0,
                                               name_len, (uint8_t *)device_name);
  app_assert_status(sc);

  sc = sl_bt_gatt_server_write_attribute_value(gattdb_beacon_config, 0,
                                               E73_PAYLOAD_LEN, payload);
  app_assert_status(sc);

  sc = sl_bt_advertiser_set_timing(advertising_set_handle,
                                   ADV_INTERVAL_UNITS,
                                   ADV_INTERVAL_UNITS,
                                   0,   // khong timeout
                                   0);  // khong gioi han so lan phat
  app_assert_status(sc);

  sc = sl_bt_legacy_advertiser_start(advertising_set_handle,
                                     sl_bt_legacy_advertiser_connectable);
  app_assert_status(sc);
}

void app_init(void)
{
  load_config();
}

void app_process_action(void)
{
}

void sl_bt_on_event(sl_bt_msg_t *evt)
{
  sl_status_t sc;

  switch (SL_BT_MSG_ID(evt->header)) {
    case sl_bt_evt_system_boot_id: {
      int16_t set_min;
      int16_t set_max;
      sc = sl_bt_system_set_tx_power(TX_POWER_MIN_DDBM, TX_POWER_MAX_DDBM,
                                     &set_min, &set_max);
      app_assert_status(sc);

      sc = sl_bt_advertiser_create_set(&advertising_set_handle);
      app_assert_status(sc);

      setup_advertising();
      break;
    }

    // Stack tu ngung quang ba khi co ket noi -> beacon chi nhan du lieu
    case sl_bt_evt_connection_opened_id:
      connected = true;
      break;

    case sl_bt_evt_connection_closed_id:
      connected = false;
      config_dirty = false;
      setup_advertising();  // rebuild voi payload hien hanh
      break;

    // Ghi config qua BLE (nRF Connect / Simplicity Connect)
    case sl_bt_evt_gatt_server_attribute_value_id:
      if (evt->data.evt_gatt_server_attribute_value.attribute == gattdb_beacon_config) {
        const uint8_t *data = evt->data.evt_gatt_server_attribute_value.value.data;
        uint8_t vlen = evt->data.evt_gatt_server_attribute_value.value.len;
        if ((vlen == E73_PAYLOAD_LEN)
            && (data[0] == E73_MAGIC)
            && (data[1] == E73_VERSION)) {
          memcpy(payload, data, E73_PAYLOAD_LEN);
          save_config();
          if (connected) {
            config_dirty = true;  // ap dung khi ngat ket noi
          } else {
            setup_advertising();
          }
        }
      }
      break;

    default:
      break;
  }
}
