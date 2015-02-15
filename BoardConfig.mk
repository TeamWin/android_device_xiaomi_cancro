#
# Copyright (C) 2015 The CyanogenMod Project
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
#

BOARD_VENDOR 										:= xiaomi
TARGET_RELEASETOOLS_EXTENSIONS 	:= device/xiaomi/cancro

# Include path
TARGET_SPECIFIC_HEADER_PATH := device/xiaomi/cancro/include

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME  := MSM8974
TARGET_NO_BOOTLOADER          := true
TARGET_NO_RADIOIMAGE          := true

# Platform
TARGET_BOARD_PLATFORM     := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

# Architecture
TARGET_ARCH                         := arm
TARGET_ARCH_VARIANT                 := armv7-a-neon
TARGET_CPU_ABI                      := armeabi-v7a
TARGET_CPU_ABI2                     := armeabi
TARGET_CPU_SMP                      := true
TARGET_CPU_VARIANT                  := krait
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Kernel
TARGET_PREBUILT_KERNEL    := device/xiaomi/cancro/kernel
BOARD_KERNEL_CMDLINE      := ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3  androidboot.selinux=permissive 
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_BASE         := 0x00000000
BOARD_KERNEL_PAGESIZE     := 2048
BOARD_MKBOOTIMG_ARGS      := --ramdisk_offset 0x02000000 --tags_offset 0x0100

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Audio
BOARD_USES_ALSA_AUDIO                       := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS  := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL             := true

# Bluetooth
BOARD_HAVE_BLUETOOTH                        := true
BOARD_HAVE_BLUETOOTH_QCOM                   := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/xiaomi/cancro/bluetooth
QCOM_BT_USE_SMD_TTY                         := true
BLUETOOTH_HCI_USE_MCT                       := true

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# Graphics
BOARD_EGL_CFG                   := device/xiaomi/cancro/configs/egl.cfg
USE_OPENGL_RENDERER             := true
TARGET_USES_C2D_COMPOSITION     := true
TARGET_USES_ION                 := true
TARGET_USE_ION_COMPAT           := true
OVERRIDE_RS_DRIVER              := libRSDriver_adreno.so
HAVE_ADRENO_SOURCE              := false
VSYNC_EVENT_PHASE_OFFSET_NS     := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS  := 5000000

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DOPPO_CAMERA_HARDWARE

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_HAVE_XIAOMI_WIFI           := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
TARGET_USES_WCNSS_CTRL           := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4            := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE     := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE        := 0x01000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE    := 0x01000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE      := 671088640
BOARD_USERDATAIMAGE_PARTITION_SIZE    := 536870912
BOARD_CACHEIMAGE_PARTITION_SIZE       := 402653184
BOARD_PERSISTIMAGE_PARTITION_SIZE     := 16777216
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE  := 73400320
BOARD_FLASH_BLOCK_SIZE                := 131072

# TWRP configuration
DEVICE_RESOLUTION                       := 1080x1920
BOARD_HAS_NO_REAL_SDCARD                := true
TARGET_PREBUILT_RECOVERY_KERNEL         := $(call my-dir)/kernel
RECOVERY_GRAPHICS_USE_LINELENGTH        := true
TARGET_RECOVERY_PIXEL_FORMAT            := "RGBX_8888"
# TARGET_RECOVERY_FSTAB                   := device/xiaomi/cancro/twrp.fstab
TARGET_RECOVERY_FSTAB                   := device/xiaomi/cancro/rootdir/etc/fstab.qcom
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID  := true
RECOVERY_FSTAB_VERSION                  := 2
BOARD_NATIVE_DUALBOOT                   := true
BOARD_NATIVE_DUALBOOT_SINGLEDATA        := true
TARGET_RECOVERY_LCD_BACKLIGHT_PATH      := "/sys/class/leds/lcd-backlight/brightness"
TW_NO_SCREEN_TIMEOUT                    := true
TW_NO_SCREEN_BLANK                      := true
TARGET_RECOVERY_QCOM_RTC_FIX            := true
BOARD_SUPPRESS_SECURE_ERASE             := true
BOARD_SUPPRESS_EMMC_WIPE                := true
RECOVERY_SDCARD_ON_DATA                 := true

# Some Dual boot reacovery code not needed for now
# USE_CHINESE_RECOVERY := false
# ifneq ($(USE_CHINESE_RECOVERY),true)
# BOARD_CUSTOM_RECOVERY_UI         := \
# 	../../$(COMMON_PATH)/recovery/dualboot.c \
# 	../../$(COMMON_PATH)/recovery/recovery_ui.c
# else
# BOARD_CUSTOM_RECOVERY_UI         := \
# 	../../$(COMMON_PATH)/recovery/dualboot_cn.c \
# 	../../$(COMMON_PATH)/recovery/recovery_ui_cn.c
# endif

# No old RPC for prop
TARGET_NO_RPC := true

# GPS HAL lives here
TARGET_GPS_HAL_PATH         := device/xiaomi/cancro/gps
TARGET_PROVIDES_GPS_LOC_API := true

# QCRIL
#TARGET_RIL_VARIANT := caf

# Use HW crypto for ODE
TARGET_HW_DISK_ENCRYPTION := false

# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Disable Block Based OTA
BLOCK_BASED_OTA := false

# Pre odex the ROM Package (disabled as it maxxed out system image size)
# WITH_DEXPREOPT := true

# Flags
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Power HAL
TARGET_POWERHAL_VARIANT := qcom

# Consumer IR
TARGET_PROVIDES_CONSUMERIR_HAL := true

# Simple time service client
BOARD_USES_QC_TIME_SERVICES := true

# Logging
TARGET_USES_LOGD := false

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# SELinux policies
# qcom sepolicy
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
        device/xiaomi/msm8974-common/sepolicy

-include vendor/xiaomi/cancro/BoardConfigVendor.mk
