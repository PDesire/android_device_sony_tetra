# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_BOARD_PLATFORM := bcm_java
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7

TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
TARGET_NO_KERNEL := false

BOARD_KERNEL_BASE        := 0x82000000
BOARD_KERNEL_PAGESIZE    := 2048

BOARD_KERNEL_CMDLINE += console=ttyHSL0,115200,n8
BOARD_KERNEL_CMDLINE += vmalloc=300M

BOARD_BOOTIMAGE_PARTITION_SIZE     :=   23068672
BOARD_SYSTEMIMAGE_PARTITION_SIZE   :=  536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2873867776
BOARD_CACHEIMAGE_PARTITION_SIZE    :=  377487360
BOARD_FLASH_BLOCK_SIZE := 4096

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_RECOVERY_FSTAB = device/sony/tetra/rootdir/fstab.tetra

# GFX
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Audio
BOARD_USES_ALSA_AUDIO := true

# GPS
# NA

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Wi-Fi definitions for Broadcom solution
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"

# BT definitions for Broadcom solution
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/shinano/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/sony/shinano/bluetooth/vnd_generic.txt

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

BUILD_KERNEL := true
include device/sony/common-headers/KernelHeaders.mk
-include device/sony/common-kernel/KernelConfig.mk

# Include build helpers for QCOM proprietary
-include vendor/qcom/proprietary/common/build/proprietary-build.mk

# SELinux
include device/sony/sepolicy/sepolicy.mk

