####################################################################
# Automatically-generated file. Do not edit!                       #
# Makefile Version 16                                              #
####################################################################

BASE_SDK_PATH = /home/ncd/silabs/simplicity_sdk
BASE_PKG_PATH = /home/ncd/.silabs/slt/installs
UNAME:=$(shell $(POSIX_TOOL_PATH)uname -s | $(POSIX_TOOL_PATH)sed -e 's/^\(CYGWIN\).*/\1/' | $(POSIX_TOOL_PATH)sed -e 's/^\(MINGW\).*/\1/')
ifeq ($(UNAME),MINGW)
# Translate "C:/super" into "/C/super" for MinGW make.
SDK_PATH := /$(shell $(POSIX_TOOL_PATH)echo $(BASE_SDK_PATH) | sed s/://)
PKG_PATH := /$(shell $(POSIX_TOOL_PATH)echo $(BASE_PKG_PATH) | sed s/://)
endif
SDK_PATH ?= $(BASE_SDK_PATH)
PKG_PATH ?= $(BASE_PKG_PATH)
COPIED_SDK_PATH ?= simplicity_sdk_2025.6.3

# This uses the explicit build rules below
PROJECT_SOURCE_FILES =

C_SOURCE_FILES   += $(filter %.c, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cpp, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cc, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.s, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.S, $(PROJECT_SOURCE_FILES))
LIB_FILES        += $(filter %.a, $(PROJECT_SOURCE_FILES))

C_DEFS += \
 '-DEFR32BG22C112F352GM32=1' \
 '-DSL_CODE_COMPONENT_SYSTEM=system' \
 '-DSL_APP_PROPERTIES=1' \
 '-DBOOTLOADER_APPLOADER=1' \
 '-DSL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DSL_CODE_COMPONENT_DEVICE_PERIPHERAL=device_peripheral' \
 '-DSL_CODE_COMPONENT_GPIO=gpio' \
 '-DSL_CODE_COMPONENT_HAL_COMMON=hal_common' \
 '-DSL_CODE_COMPONENT_HAL_GPIO=hal_gpio' \
 '-DSL_CODE_COMPONENT_INTERRUPT_MANAGER=interrupt_manager' \
 '-DCMSIS_NVIC_VIRTUAL=1' \
 '-DCMSIS_NVIC_VIRTUAL_HEADER_FILE="cmsis_nvic_virtual.h"' \
 '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_config.h>' \
 '-DSL_CODE_COMPONENT_POWER_MANAGER=power_manager' \
 '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DSL_CODE_COMPONENT_SE_MANAGER=se_manager' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_RAIL_3_API=1' \
 '-DSL_CODE_COMPONENT_SLEEPTIMER=sleeptimer' \
 '-DSL_CODE_COMPONENT_SLI_CRYPTO=sli_crypto' \
 '-DSLI_RADIOAES_REQUIRES_MASKING=1' \
 '-DSL_CODE_COMPONENT_SLI_PROTOCOL_CRYPTO=sli_protocol_crypto' \
 '-DSL_CODE_COMPONENT_PSEC_OSAL=psec_osal'

ASM_DEFS += \
 '-DEFR32BG22C112F352GM32=1' \
 '-DSL_CODE_COMPONENT_SYSTEM=system' \
 '-DSL_APP_PROPERTIES=1' \
 '-DBOOTLOADER_APPLOADER=1' \
 '-DSL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DSL_CODE_COMPONENT_DEVICE_PERIPHERAL=device_peripheral' \
 '-DSL_CODE_COMPONENT_GPIO=gpio' \
 '-DSL_CODE_COMPONENT_HAL_COMMON=hal_common' \
 '-DSL_CODE_COMPONENT_HAL_GPIO=hal_gpio' \
 '-DSL_CODE_COMPONENT_INTERRUPT_MANAGER=interrupt_manager' \
 '-DCMSIS_NVIC_VIRTUAL=1' \
 '-DCMSIS_NVIC_VIRTUAL_HEADER_FILE="cmsis_nvic_virtual.h"' \
 '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_config.h>' \
 '-DSL_CODE_COMPONENT_POWER_MANAGER=power_manager' \
 '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DSL_CODE_COMPONENT_SE_MANAGER=se_manager' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_RAIL_3_API=1' \
 '-DSL_CODE_COMPONENT_SLEEPTIMER=sleeptimer' \
 '-DSL_CODE_COMPONENT_SLI_CRYPTO=sli_crypto' \
 '-DSLI_RADIOAES_REQUIRES_MASKING=1' \
 '-DSL_CODE_COMPONENT_SLI_PROTOCOL_CRYPTO=sli_protocol_crypto' \
 '-DSL_CODE_COMPONENT_PSEC_OSAL=psec_osal'

INCLUDES += \
 -Iautogen \
 -Iconfig \
 -Iconfig/btconf \
 -I. \
 -I$(SDK_PATH)/platform/Device/SiliconLabs/EFR32BG22/Include \
 -I$(SDK_PATH)/app/common/util/app_assert \
 -I$(SDK_PATH)/app/common/util/app_timer \
 -I$(SDK_PATH)/app/common/util/app_timer/bm \
 -I$(SDK_PATH)/protocol/bluetooth/inc \
 -I$(SDK_PATH)/platform/common/inc \
 -I$(SDK_PATH)/protocol/bluetooth/bgcommon/inc \
 -I$(SDK_PATH)/protocol/bluetooth/bgstack/ll/inc \
 -I$(SDK_PATH)/platform/bootloader \
 -I$(SDK_PATH)/platform/bootloader/api \
 -I$(SDK_PATH)/platform/bootloader/core/flash \
 -I$(SDK_PATH)/platform/service/clock_manager/inc \
 -I$(SDK_PATH)/platform/service/clock_manager/src \
 -I$(SDK_PATH)/platform/CMSIS/Core/Include \
 -I$(SDK_PATH)/platform/service/device_manager/inc \
 -I$(SDK_PATH)/platform/service/device_init/inc \
 -I$(SDK_PATH)/platform/emdrv/common/inc \
 -I$(SDK_PATH)/platform/emlib/inc \
 -I$(SDK_PATH)/app/bluetooth/common/gatt_service_device_information_override \
 -I$(SDK_PATH)/platform/driver/gpio/inc \
 -I$(SDK_PATH)/platform/peripheral/inc \
 -I$(SDK_PATH)/app/bluetooth/common/in_place_ota_dfu \
 -I$(SDK_PATH)/platform/service/interrupt_manager/inc \
 -I$(SDK_PATH)/platform/service/interrupt_manager/src \
 -I$(SDK_PATH)/platform/service/interrupt_manager/inc/arm \
 -I$(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/include \
 -I$(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/config \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/config/preset \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/inc \
 -I$(SDK_PATH)/util/third_party/mbedtls/include \
 -I$(SDK_PATH)/util/third_party/mbedtls/library \
 -I$(SDK_PATH)/platform/service/memory_manager/inc \
 -I$(SDK_PATH)/platform/service/memory_manager/src \
 -I$(SDK_PATH)/platform/service/memory_manager/profiler/inc \
 -I$(SDK_PATH)/platform/service/mpu/inc \
 -I$(SDK_PATH)/platform/emdrv/nvm3/inc \
 -I$(SDK_PATH)/platform/emdrv/nvm3/config \
 -I$(SDK_PATH)/platform/service/power_manager/inc \
 -I$(SDK_PATH)/platform/security/sl_component/sl_psa_driver/inc \
 -I$(SDK_PATH)/platform/radio/rail_lib/common \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/ble \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/ieee802154 \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/wmbus \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/zwave \
 -I$(SDK_PATH)/platform/radio/rail_lib/chip/efr32/efr32xg2x \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/sidewalk \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/efr32xg22 \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti \
 -I$(SDK_PATH)/platform/security/sl_component/se_manager/inc \
 -I$(SDK_PATH)/platform/service/sl_main/inc \
 -I$(SDK_PATH)/platform/service/sl_main/src \
 -I$(SDK_PATH)/platform/service/sleeptimer/inc \
 -I$(SDK_PATH)/platform/security/sl_component/sli_crypto/inc \
 -I$(SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src \
 -I$(SDK_PATH)/platform/security/sl_component/sli_psec_osal/inc \
 -I$(SDK_PATH)/platform/service/udelay/inc

GROUP_START =-Wl,--start-group
GROUP_END =-Wl,--end-group

PROJECT_LIBS = \
 -lgcc \
 -lc \
 -lm \
 -lnosys \
 $(SDK_PATH)/protocol/bluetooth/bgcommon/lib/build/gcc/cortex-m33/bgcommon/release/libbgcommon.a \
 $(SDK_PATH)/protocol/bluetooth/bgstack/ll/build/gcc/xg22/release/liblinklayer.a \
 $(SDK_PATH)/protocol/bluetooth/build/gcc/cortex-m33/ble_host/bgstack/release/libbondingdb.a \
 $(SDK_PATH)/protocol/bluetooth/build/gcc/cortex-m33/ble_host/ble_bgapi/release/libble_bgapi_gatt_client.a \
 $(SDK_PATH)/protocol/bluetooth/build/gcc/cortex-m33/ble_host/ble_bgapi/release/libble_bgapi_gatt_server.a \
 $(SDK_PATH)/protocol/bluetooth/build/gcc/cortex-m33/bgapi_protocol/api3/release/libbgapi_core.a \
 $(SDK_PATH)/protocol/bluetooth/build/gcc/cortex-m33/ble_host/accept_list/release/libble_host_accept_list_stub.a \
 $(SDK_PATH)/protocol/bluetooth/build/gcc/cortex-m33/ble_host/bgstack/release/libble_host.a \
 $(SDK_PATH)/protocol/bluetooth/build/gcc/cortex-m33/ble_host/ble_bgapi/release/libble_bgapi.a \
 $(SDK_PATH)/protocol/bluetooth/build/gcc/cortex-m33/ble_host/ble_system/release/libble_system.a \
 $(SDK_PATH)/protocol/bluetooth/build/gcc/cortex-m33/ble_host/connection_subrating/release/libble_host_connection_subrating_stub.a \
 $(SDK_PATH)/protocol/bluetooth/build/gcc/cortex-m33/ble_host/core/release/libble_host_core.a \
 $(SDK_PATH)/protocol/bluetooth/build/gcc/cortex-m33/ble_host/hal/release/libble_host_hal_series2.a \
 $(SDK_PATH)/protocol/bluetooth/build/gcc/cortex-m33/ble_host/hci/release/libble_host_hci.a \
 $(SDK_PATH)/protocol/bluetooth/build/gcc/cortex-m33/ble_host/system/release/libble_host_system.a \
 $(SDK_PATH)/platform/radio/rail_lib/autogen/librail_release/librail_efr32xg22_gcc_release.a

LIBS += $(GROUP_START) $(PROJECT_LIBS) $(GROUP_END)

LIB_FILES += $(filter %.a, $(PROJECT_LIBS))

C_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -std=c18 \
 -mcmse \
 -Wall \
 -Wextra \
 -Os \
 -fdata-sections \
 -ffunction-sections \
 -fomit-frame-pointer \
 -g \
 -fno-lto \
 --specs=nano.specs

CXX_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -std=c++17 \
 -fno-rtti \
 -fno-exceptions \
 -mcmse \
 -Wall \
 -Wextra \
 -Os \
 -fdata-sections \
 -ffunction-sections \
 -fomit-frame-pointer \
 -g \
 -fno-lto \
 --specs=nano.specs

ASM_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -x assembler-with-cpp

LD_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -T"autogen/linkerfile.ld" \
 --specs=nano.specs \
 -Xlinker -Map=$(OUTPUT_DIR)/$(PROJECTNAME).map \
 -Wl,--wrap=_free_r -Wl,--wrap=_malloc_r -Wl,--wrap=_calloc_r -Wl,--wrap=_realloc_r \
 -fno-lto \
 -Wl,--gc-sections


####################################################################
# Pre/Post Build Rules                                             #
####################################################################
pre-build:
	# No pre-build defined

post-build: $(OUTPUT_DIR)/$(PROJECTNAME).out
ifeq ($(POST_BUILD_EXE),)
		$(error POST_BUILD_EXE is not defined. Post-Build cannot run. Please set the STUDIO_ADAPTER_PACK_PATH to the post-build tool when generating or override the variable for this makefile)
endif
	@$(POSIX_TOOL_PATH)echo 'Running Project Post-Build'
	$(ECHO) @"$(POST_BUILD_EXE)" postbuild "./beacon_bt53.slpb" --parameter build_dir:"$(OUTPUT_DIR)"

####################################################################
# SDK Build Rules                                                  #
####################################################################
$(OUTPUT_DIR)/sdk/app/bluetooth/common/in_place_ota_dfu/sl_bt_in_place_ota_dfu.o: $(SDK_PATH)/app/bluetooth/common/in_place_ota_dfu/sl_bt_in_place_ota_dfu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/app/bluetooth/common/in_place_ota_dfu/sl_bt_in_place_ota_dfu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/app/bluetooth/common/in_place_ota_dfu/sl_bt_in_place_ota_dfu.c
CDEPS += $(OUTPUT_DIR)/sdk/app/bluetooth/common/in_place_ota_dfu/sl_bt_in_place_ota_dfu.d
OBJS += $(OUTPUT_DIR)/sdk/app/bluetooth/common/in_place_ota_dfu/sl_bt_in_place_ota_dfu.o

$(OUTPUT_DIR)/sdk/app/common/util/app_timer/bm/app_timer.o: $(SDK_PATH)/app/common/util/app_timer/bm/app_timer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/app/common/util/app_timer/bm/app_timer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/app/common/util/app_timer/bm/app_timer.c
CDEPS += $(OUTPUT_DIR)/sdk/app/common/util/app_timer/bm/app_timer.d
OBJS += $(OUTPUT_DIR)/sdk/app/common/util/app_timer/bm/app_timer.o

$(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface.o: $(SDK_PATH)/platform/bootloader/api/btl_interface.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/bootloader/api/btl_interface.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/bootloader/api/btl_interface.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface.o

$(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_storage.o: $(SDK_PATH)/platform/bootloader/api/btl_interface_storage.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/bootloader/api/btl_interface_storage.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/bootloader/api/btl_interface_storage.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_storage.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_storage.o

$(OUTPUT_DIR)/sdk/platform/bootloader/app_properties/app_properties.o: $(SDK_PATH)/platform/bootloader/app_properties/app_properties.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/bootloader/app_properties/app_properties.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/bootloader/app_properties/app_properties.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/app_properties/app_properties.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/app_properties/app_properties.o

$(OUTPUT_DIR)/sdk/platform/bootloader/core/flash/btl_internal_flash.o: $(SDK_PATH)/platform/bootloader/core/flash/btl_internal_flash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/bootloader/core/flash/btl_internal_flash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/bootloader/core/flash/btl_internal_flash.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/core/flash/btl_internal_flash.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/core/flash/btl_internal_flash.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o: $(SDK_PATH)/platform/common/src/sl_assert.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_assert.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_assert.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_core_cortexm.o: $(SDK_PATH)/platform/common/src/sl_core_cortexm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_core_cortexm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_core_cortexm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_core_cortexm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_core_cortexm.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.o: $(SDK_PATH)/platform/common/src/sl_slist.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_slist.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_slist.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.o: $(SDK_PATH)/platform/common/src/sl_syscalls.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_syscalls.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_syscalls.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.o

$(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32BG22/Source/startup_efr32bg22.o: $(SDK_PATH)/platform/Device/SiliconLabs/EFR32BG22/Source/startup_efr32bg22.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/Device/SiliconLabs/EFR32BG22/Source/startup_efr32bg22.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/Device/SiliconLabs/EFR32BG22/Source/startup_efr32bg22.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32BG22/Source/startup_efr32bg22.d
OBJS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32BG22/Source/startup_efr32bg22.o

$(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32BG22/Source/system_efr32bg22.o: $(SDK_PATH)/platform/Device/SiliconLabs/EFR32BG22/Source/system_efr32bg22.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/Device/SiliconLabs/EFR32BG22/Source/system_efr32bg22.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/Device/SiliconLabs/EFR32BG22/Source/system_efr32bg22.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32BG22/Source/system_efr32bg22.d
OBJS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32BG22/Source/system_efr32bg22.o

$(OUTPUT_DIR)/sdk/platform/driver/gpio/src/sl_gpio.o: $(SDK_PATH)/platform/driver/gpio/src/sl_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/driver/gpio/src/sl_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/driver/gpio/src/sl_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/driver/gpio/src/sl_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/driver/gpio/src/sl_gpio.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_cache.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_cache.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_cache.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_cache.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_cache.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_cache.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_default_common_linker.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_default_common_linker.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_default_common_linker.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_default_common_linker.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_default_common_linker.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_default_common_linker.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_hal_flash.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_hal_flash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_hal_flash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_hal_flash.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_hal_flash.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_hal_flash.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_lock.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_lock.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_lock.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_lock.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_lock.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_lock.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_object.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_object.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_object.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_object.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_object.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_object.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_page.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_page.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_page.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_page.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_page.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_page.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_utils.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_utils.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_utils.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_utils.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_utils.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_utils.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_burtc.o: $(SDK_PATH)/platform/emlib/src/em_burtc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_burtc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_burtc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_burtc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_burtc.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.o: $(SDK_PATH)/platform/emlib/src/em_cmu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_cmu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_cmu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.o: $(SDK_PATH)/platform/emlib/src/em_emu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_emu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_emu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.o: $(SDK_PATH)/platform/emlib/src/em_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_iadc.o: $(SDK_PATH)/platform/emlib/src/em_iadc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_iadc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_iadc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_iadc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_iadc.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.o: $(SDK_PATH)/platform/emlib/src/em_msc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_msc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_msc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.o: $(SDK_PATH)/platform/emlib/src/em_prs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_prs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_prs.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_rtcc.o: $(SDK_PATH)/platform/emlib/src/em_rtcc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_rtcc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_rtcc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_rtcc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_rtcc.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o: $(SDK_PATH)/platform/emlib/src/em_system.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_system.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_system.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_timer.o: $(SDK_PATH)/platform/emlib/src/em_timer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_timer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_timer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_timer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_timer.o

$(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.o: $(SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.o

$(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_system.o: $(SDK_PATH)/platform/peripheral/src/sl_hal_system.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/peripheral/src/sl_hal_system.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/peripheral/src/sl_hal_system.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_system.d
OBJS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_system.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_hash.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_hash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_hash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_hash.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_hash.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_hash.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_signature.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_signature.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_signature.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_signature.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_signature.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_signature.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_util.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_util.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_util.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_util.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_aes.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_aes.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_aes.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_aes.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_aes.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_aes.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_gcm.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_gcm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_gcm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_gcm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_gcm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_gcm.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.o: $(SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.o: $(SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/cryptoacc_management.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/cryptoacc_management.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/cryptoacc_management.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/cryptoacc_management.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/cryptoacc_management.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/cryptoacc_management.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_driver_trng.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_driver_trng.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_driver_trng.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_driver_trng.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_driver_trng.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_driver_trng.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_aead.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_aead.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_aead.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_aead.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_aead.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_aead.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_cipher.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_cipher.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_hash.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_hash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_hash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_hash.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_hash.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_hash.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_key_derivation.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_key_derivation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_key_derivation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_key_derivation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_key_derivation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_key_derivation.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_key_management.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_key_management.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_key_management.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_key_management.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_key_management.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_key_management.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_mac.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_mac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_mac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_mac.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_mac.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_mac.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_signature.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_signature.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_signature.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_signature.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_signature.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_signature.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sli_crypto/src/sl_crypto_s2.o: $(SDK_PATH)/platform/security/sl_component/sli_crypto/src/sl_crypto_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sli_crypto/src/sl_crypto_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sli_crypto/src/sl_crypto_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sli_crypto/src/sl_crypto_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sli_crypto/src/sl_crypto_s2.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager.o: $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_hal_s2.o: $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_hal_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_hal_s2.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init.o: $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.o: $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.o

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s2.o: $(SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s2.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/clocks/sl_device_clock_efr32xg22.o: $(SDK_PATH)/platform/service/device_manager/clocks/sl_device_clock_efr32xg22.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/clocks/sl_device_clock_efr32xg22.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/clocks/sl_device_clock_efr32xg22.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/clocks/sl_device_clock_efr32xg22.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/clocks/sl_device_clock_efr32xg22.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg22.o: $(SDK_PATH)/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg22.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg22.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg22.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg22.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg22.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_clock.o: $(SDK_PATH)/platform/service/device_manager/src/sl_device_clock.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/src/sl_device_clock.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/src/sl_device_clock.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_clock.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_clock.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_gpio.o: $(SDK_PATH)/platform/service/device_manager/src/sl_device_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/src/sl_device_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/src/sl_device_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_gpio.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_peripheral.o: $(SDK_PATH)/platform/service/device_manager/src/sl_device_peripheral.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/src/sl_device_peripheral.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/src/sl_device_peripheral.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_peripheral.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_peripheral.o

$(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.o: $(SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/profiler/src/sli_memory_profiler_stubs.o: $(SDK_PATH)/platform/service/memory_manager/profiler/src/sli_memory_profiler_stubs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/profiler/src/sli_memory_profiler_stubs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/profiler/src/sli_memory_profiler_stubs.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/profiler/src/sli_memory_profiler_stubs.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/profiler/src/sli_memory_profiler_stubs.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool_common.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool_common.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool_common.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool_common.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_retarget.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_retarget.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_retarget.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_retarget.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_retarget.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_retarget.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sli_memory_manager_common.o: $(SDK_PATH)/platform/service/memory_manager/src/sli_memory_manager_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sli_memory_manager_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sli_memory_manager_common.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sli_memory_manager_common.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sli_memory_manager_common.o

$(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu_s2.o: $(SDK_PATH)/platform/service/mpu/src/sl_mpu_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/mpu/src/sl_mpu_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/mpu/src/sl_mpu_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu_s2.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_common.o: $(SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_common.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_common.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_common.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_em4.o: $(SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_em4.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_em4.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_em4.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_em4.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_em4.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager.o: $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.o: $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.o: $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.o

$(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init.o: $(SDK_PATH)/platform/service/sl_main/src/sl_main_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sl_main/src/sl_main_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sl_main/src/sl_main_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init.o

$(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init_memory.o: $(SDK_PATH)/platform/service/sl_main/src/sl_main_init_memory.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sl_main/src/sl_main_init_memory.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sl_main/src/sl_main_init_memory.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init_memory.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init_memory.o

$(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_process_action.o: $(SDK_PATH)/platform/service/sl_main/src/sl_main_process_action.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sl_main/src/sl_main_process_action.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sl_main/src/sl_main_process_action.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_process_action.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_process_action.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer.o: $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.o: $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.o: $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.o: $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.o: $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.o

$(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay.o: $(SDK_PATH)/platform/service/udelay/src/sl_udelay.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/udelay/src/sl_udelay.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/udelay/src/sl_udelay.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay.o

$(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay_armv6m_gcc.o: $(SDK_PATH)/platform/service/udelay/src/sl_udelay_armv6m_gcc.S
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/udelay/src/sl_udelay_armv6m_gcc.S'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(ASMFLAGS) -c -o $@ $(SDK_PATH)/platform/service/udelay/src/sl_udelay_armv6m_gcc.S
ASMDEPS_S += $(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay_armv6m_gcc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay_armv6m_gcc.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/bgcommon/src/sli_bgcommon_debug_efr32.o: $(SDK_PATH)/protocol/bluetooth/bgcommon/src/sli_bgcommon_debug_efr32.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/bgcommon/src/sli_bgcommon_debug_efr32.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/bgcommon/src/sli_bgcommon_debug_efr32.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgcommon/src/sli_bgcommon_debug_efr32.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgcommon/src/sli_bgcommon_debug_efr32.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init.o: $(SDK_PATH)/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init_tasklets.o: $(SDK_PATH)/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init_tasklets.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init_tasklets.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init_tasklets.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init_tasklets.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init_tasklets.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sl_apploader_util_s2.o: $(SDK_PATH)/protocol/bluetooth/src/sl_apploader_util_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/src/sl_apploader_util_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/src/sl_apploader_util_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sl_apploader_util_s2.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sl_apploader_util_s2.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sl_bt_stack_init.o: $(SDK_PATH)/protocol/bluetooth/src/sl_bt_stack_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/src/sl_bt_stack_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/src/sl_bt_stack_init.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sl_bt_stack_init.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sl_bt_stack_init.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_accept_list_config.o: $(SDK_PATH)/protocol/bluetooth/src/sli_bt_accept_list_config.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/src/sli_bt_accept_list_config.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/src/sli_bt_accept_list_config.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_accept_list_config.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_accept_list_config.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_advertiser_config.o: $(SDK_PATH)/protocol/bluetooth/src/sli_bt_advertiser_config.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/src/sli_bt_advertiser_config.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/src/sli_bt_advertiser_config.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_advertiser_config.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_advertiser_config.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_connection_config.o: $(SDK_PATH)/protocol/bluetooth/src/sli_bt_connection_config.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/src/sli_bt_connection_config.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/src/sli_bt_connection_config.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_connection_config.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_connection_config.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_dynamic_gattdb_config.o: $(SDK_PATH)/protocol/bluetooth/src/sli_bt_dynamic_gattdb_config.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/src/sli_bt_dynamic_gattdb_config.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/src/sli_bt_dynamic_gattdb_config.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_dynamic_gattdb_config.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_dynamic_gattdb_config.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_external_bondingdb_config.o: $(SDK_PATH)/protocol/bluetooth/src/sli_bt_external_bondingdb_config.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/src/sli_bt_external_bondingdb_config.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/src/sli_bt_external_bondingdb_config.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_external_bondingdb_config.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_external_bondingdb_config.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_host_adaptation.o: $(SDK_PATH)/protocol/bluetooth/src/sli_bt_host_adaptation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/src/sli_bt_host_adaptation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/src/sli_bt_host_adaptation.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_host_adaptation.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_host_adaptation.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_l2cap_config.o: $(SDK_PATH)/protocol/bluetooth/src/sli_bt_l2cap_config.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/src/sli_bt_l2cap_config.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/src/sli_bt_l2cap_config.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_l2cap_config.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_l2cap_config.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_pawr_advertiser_config.o: $(SDK_PATH)/protocol/bluetooth/src/sli_bt_pawr_advertiser_config.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/src/sli_bt_pawr_advertiser_config.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/src/sli_bt_pawr_advertiser_config.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_pawr_advertiser_config.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_pawr_advertiser_config.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_periodic_advertiser_config.o: $(SDK_PATH)/protocol/bluetooth/src/sli_bt_periodic_advertiser_config.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/src/sli_bt_periodic_advertiser_config.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/src/sli_bt_periodic_advertiser_config.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_periodic_advertiser_config.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_periodic_advertiser_config.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_sync_config.o: $(SDK_PATH)/protocol/bluetooth/src/sli_bt_sync_config.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/src/sli_bt_sync_config.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/src/sli_bt_sync_config.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_sync_config.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/src/sli_bt_sync_config.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/ba414ep_config.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/ba414ep_config.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/ba414ep_config.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/ba414ep_config.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/ba414ep_config.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/ba414ep_config.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/ba431_config.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/ba431_config.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/ba431_config.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/ba431_config.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/ba431_config.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/ba431_config.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/cryptodma_internal.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/cryptodma_internal.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/cryptodma_internal.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/cryptodma_internal.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/cryptodma_internal.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/cryptodma_internal.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/cryptolib_types.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/cryptolib_types.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/cryptolib_types.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/cryptolib_types.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/cryptolib_types.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/cryptolib_types.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_aes.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_aes.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_aes.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_aes.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_aes.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_aes.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_blk_cipher.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_blk_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_blk_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_blk_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_blk_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_blk_cipher.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_dh_alg.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_dh_alg.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_dh_alg.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_dh_alg.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_dh_alg.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_dh_alg.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_ecc_curves.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_ecc_curves.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_ecc_curves.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_ecc_curves.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_ecc_curves.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_ecc_curves.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_ecc_keygen_alg.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_ecc_keygen_alg.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_ecc_keygen_alg.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_ecc_keygen_alg.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_ecc_keygen_alg.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_ecc_keygen_alg.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_ecdsa_alg.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_ecdsa_alg.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_ecdsa_alg.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_ecdsa_alg.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_ecdsa_alg.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_ecdsa_alg.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_hash.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_hash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_hash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_hash.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_hash.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_hash.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_math.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_math.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_math.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_math.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_math.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_math.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_memcmp.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_memcmp.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_memcmp.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_memcmp.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_memcmp.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_memcmp.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_memcpy.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_memcpy.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_memcpy.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_memcpy.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_memcpy.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_memcpy.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_primitives.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_primitives.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_primitives.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_primitives.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_primitives.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_primitives.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_rng.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_rng.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_rng.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_rng.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_rng.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_rng.o

$(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_trng.o: $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_trng.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_trng.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/crypto_ip/libcryptosoc/src/sx_trng.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_trng.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/crypto_ip/libcryptosoc/src/sx_trng.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher.o: $(SDK_PATH)/util/third_party/mbedtls/library/cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher_wrap.o: $(SDK_PATH)/util/third_party/mbedtls/library/cipher_wrap.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/cipher_wrap.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/cipher_wrap.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher_wrap.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher_wrap.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.o: $(SDK_PATH)/util/third_party/mbedtls/library/constant_time.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/constant_time.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/constant_time.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform.o: $(SDK_PATH)/util/third_party/mbedtls/library/platform.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/platform.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/platform.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform_util.o: $(SDK_PATH)/util/third_party/mbedtls/library/platform_util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/platform_util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/platform_util.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform_util.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform_util.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_aead.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_aead.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_aead.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_aead.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_aead.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_aead.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_cipher.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_cipher.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_client.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_client.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_client.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_client.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_client.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_client.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ecp.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ecp.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ecp.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ecp.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ecp.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ecp.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ffdh.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ffdh.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ffdh.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ffdh.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ffdh.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ffdh.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_hash.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_hash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_hash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_hash.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_hash.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_hash.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_mac.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_mac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_mac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_mac.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_mac.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_mac.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_pake.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_pake.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_pake.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_pake.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_pake.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_pake.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_rsa.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_rsa.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_rsa.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_rsa.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_rsa.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_rsa.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_se.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_se.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_se.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_se.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_se.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_se.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_slot_management.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_slot_management.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_slot_management.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_slot_management.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_slot_management.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_slot_management.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_storage.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_storage.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_storage.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_storage.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_storage.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_storage.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_util.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.o: $(SDK_PATH)/util/third_party/mbedtls/library/threading.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/threading.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/threading.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.o

$(OUTPUT_DIR)/project/app.o: app.c
	@$(POSIX_TOOL_PATH)echo 'Building app.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ app.c
CDEPS += $(OUTPUT_DIR)/project/app.d
OBJS += $(OUTPUT_DIR)/project/app.o

$(OUTPUT_DIR)/project/app_bm.o: app_bm.c
	@$(POSIX_TOOL_PATH)echo 'Building app_bm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ app_bm.c
CDEPS += $(OUTPUT_DIR)/project/app_bm.d
OBJS += $(OUTPUT_DIR)/project/app_bm.o

$(OUTPUT_DIR)/project/autogen/gatt_db.o: autogen/gatt_db.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/gatt_db.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/gatt_db.c
CDEPS += $(OUTPUT_DIR)/project/autogen/gatt_db.d
OBJS += $(OUTPUT_DIR)/project/autogen/gatt_db.o

$(OUTPUT_DIR)/project/autogen/sl_bluetooth.o: autogen/sl_bluetooth.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_bluetooth.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_bluetooth.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_bluetooth.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_bluetooth.o

$(OUTPUT_DIR)/project/autogen/sl_event_handler.o: autogen/sl_event_handler.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_event_handler.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_event_handler.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_event_handler.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_event_handler.o

$(OUTPUT_DIR)/project/autogen/sl_power_manager_handler.o: autogen/sl_power_manager_handler.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_power_manager_handler.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_power_manager_handler.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_power_manager_handler.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_power_manager_handler.o

$(OUTPUT_DIR)/project/main.o: main.c
	@$(POSIX_TOOL_PATH)echo 'Building main.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ main.c
CDEPS += $(OUTPUT_DIR)/project/main.d
OBJS += $(OUTPUT_DIR)/project/main.o

$(OUTPUT_DIR)/project/sl_gatt_service_device_information_override.o: sl_gatt_service_device_information_override.c
	@$(POSIX_TOOL_PATH)echo 'Building sl_gatt_service_device_information_override.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ sl_gatt_service_device_information_override.c
CDEPS += $(OUTPUT_DIR)/project/sl_gatt_service_device_information_override.d
OBJS += $(OUTPUT_DIR)/project/sl_gatt_service_device_information_override.o

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA