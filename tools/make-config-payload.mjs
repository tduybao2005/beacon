#!/usr/bin/env node
/**
 * In ra payload cấu hình 13 byte (hex) để ghi vào characteristic config của
 * beacon E73 qua BLE (dùng nRF Connect / nRF Device Manager).
 *
 * Cách dùng:
 *   node make-config-payload.mjs 79048-B04-K00-F01-0001 [txPower] [battery]
 *   -> E70100 0134C8 04 00 01 0001 C5 FF (in liền không khoảng trắng)
 *
 * Cùng định dạng với BeaconCode.ts phía app và beacon_e73.ino phía firmware:
 *   [0] magic 0xE7 | [1] version 0x01 | [2-5] hospitalCode u32 BE
 *   [6] buildingCode u8 | [7] deptCode u8 | [8] floorCode i8
 *   [9-10] idx u16 BE | [11] txPower i8 | [12] battery u8 (0xFF = không rõ)
 */

export const E73_MAGIC = 0xe7;
export const E73_VERSION = 0x01;

const CODE_RE = /^(\d+)-B(\d+)-K(\d+)-F(-?\d+)-(\d+)$/;

export function parseBeaconCode(s) {
  const m = CODE_RE.exec((s ?? '').trim());
  if (!m) return null;
  return {
    hospitalCode: parseInt(m[1], 10),
    buildingCode: parseInt(m[2], 10),
    deptCode: parseInt(m[3], 10),
    floorCode: parseInt(m[4], 10),
    idx: parseInt(m[5], 10),
  };
}

export function encodeE73Payload(code, txPower = -59, battery = 0xff) {
  const buf = new Uint8Array(13);
  buf[0] = E73_MAGIC;
  buf[1] = E73_VERSION;
  buf[2] = (code.hospitalCode >>> 24) & 0xff;
  buf[3] = (code.hospitalCode >>> 16) & 0xff;
  buf[4] = (code.hospitalCode >>> 8) & 0xff;
  buf[5] = code.hospitalCode & 0xff;
  buf[6] = code.buildingCode & 0xff;
  buf[7] = code.deptCode & 0xff;
  buf[8] = code.floorCode & 0xff;
  buf[9] = (code.idx >>> 8) & 0xff;
  buf[10] = code.idx & 0xff;
  buf[11] = txPower & 0xff;
  buf[12] = battery & 0xff;
  return buf;
}

export function toHex(buf) {
  return Array.from(buf, (b) => b.toString(16).padStart(2, '0')).join('').toUpperCase();
}

const isMain = import.meta.url === `file://${process.argv[1]}`;
if (isMain) {
  const [codeStr, txPowerArg, batteryArg] = process.argv.slice(2);
  const code = parseBeaconCode(codeStr);
  if (!code) {
    console.error('Cách dùng: node make-config-payload.mjs <code> [txPower] [battery]');
    console.error('Ví dụ:    node make-config-payload.mjs 79048-B04-K00-F01-0001 -59 100');
    process.exit(1);
  }
  const txPower = txPowerArg !== undefined ? parseInt(txPowerArg, 10) : -59;
  const battery = batteryArg !== undefined ? parseInt(batteryArg, 10) : 0xff;
  const payload = encodeE73Payload(code, txPower, battery);
  console.log(`Code:    ${codeStr}`);
  console.log(`Payload: ${toHex(payload)}`);
  console.log('Ghi 13 byte này vào characteristic E7300002-... bằng nRF Connect (Write).');
}
