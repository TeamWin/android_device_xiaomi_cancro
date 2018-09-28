DEVICE_PATH := device/xiaomi/cancro

# Architecture
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm8974
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := generic
TARGET_HARDWARE := qcom
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8974

# Kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --dt $(DEVICE_PATH)/dt.img

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16384000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16384000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13291503000
BOARD_FLASH_BLOCK_SIZE := 131072

# TWRP
LZMA_RAMDISK_TARGETS                    := boot,recovery
TARGET_USERIMAGES_USE_EXT4              := true
TARGET_USERIMAGES_USE_F2FS              := true
RECOVERY_VARIANT                        := twrp
DEVICE_RESOLUTION                       := 1080x1920
BOARD_HAS_NO_REAL_SDCARD                := true
BOARD_RECOVERY_SWIPE                    := true
RECOVERY_GRAPHICS_USE_LINELENGTH        := true
TARGET_RECOVERY_PIXEL_FORMAT            := "RGBX_8888"
TARGET_RECOVERY_FSTAB                   := $(DEVICE_PATH)/recovery.fstab
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID  := true
RECOVERY_FSTAB_VERSION                  := 2
BOARD_NATIVE_DUALBOOT                   := true
BOARD_NATIVE_DUALBOOT_SINGLEDATA        := true
TARGET_RECOVERY_LCD_BACKLIGHT_PATH      := "/sys/class/leds/lcd-backlight/brightness"
TW_INCLUDE_CRYPTO                       := true
TW_NO_SCREEN_TIMEOUT                    := true
TW_NO_SCREEN_BLANK                      := true
TARGET_RECOVERY_QCOM_RTC_FIX            := true
BOARD_SUPPRESS_SECURE_ERASE             := true
BOARD_SUPPRESS_EMMC_WIPE                := true
RECOVERY_SDCARD_ON_DATA                 := true
TW_EXTRA_LANGUAGES                      := true
