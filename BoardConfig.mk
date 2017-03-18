# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).


# inherit from the proprietary version
-include vendor/zte/warp4/BoardConfigVendor.mk
-include device/qcom/sepolicy/sepolicy.mk

BOARD_VENDOR := ZTE

ARCH_ARM_HAVE_NEON := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_INITLOGO := true
TARGET_ARCH_VARIANT := armv7-a-neon

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305
TARGET_CPU_VARIANT := krait

# Architecture
TARGET_CPU_SMP := true

# Flags for Krait CPU
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Krait optimizations
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_BOOTLOADER_BOARD_NAME := warp4
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_USES_LEGACY_MMAP := true

# Kernel
BOARD_KERNEL_SEPARATED_DT    := true
TARGET_KERNEL_SOURCE         := kernel/warp4
TARGET_KERNEL_CONFIG         := msm8226-zte-warp4_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_MKBOOTIMG_ARGS := --dt device/zte/warp4/dt.img --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_KERNEL_PAGESIZE := 2048
TARGET_SPECIFIC_HEADER_PATH := device/zte/warp4/include

BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4840226816
BOARD_CACHEIMAGE_PARTITION_SIZE := 838860800
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# Assert
TARGET_OTA_ASSERT_DEVICE := warp4

BOARD_HAS_NO_SELECT_BUTTON := true

# chargers
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGER_RES := device/zte/warp4/charger/res

# QCOM
TARGET_POWERHAL_VARIANT := qcom
#TARGET_NO_ADAPTIVE_PLAYBACK := true
#TARGET_USES_QCOM_BSP := true
BOARD_USES_QCOM_HARDWARE := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DCAMERA_VENDOR_L_COMPAT #-DQCOM_BSP #-DQCOM_COMPRESSED_AUDIO_ENABLED

# Graphics
BOARD_EGL_CFG := device/zte/warp4/prebuilt/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_GENLOCK := true
TARGET_USES_ION := true
#TARGET_USES_OVERLAY := true
#TARGET_USES_SF_BYPASS := true
#TARGET_USES_C2D_COMPOSITION := true
TARGET_PROVIDES_LIBLIGHT := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Audio
BOARD_USES_ALSA_AUDIO := true

# Camera

USE_DEVICE_SPECIFIC_CAMERA := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/zte/warp4/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/zte/warp4/bluetooth/vnd_warp4.txt

# Wifi
TARGET_USES_WCNSS_CTRL          := true
BOARD_HAS_QCOM_WLAN_SDK 	:= true
BOARD_HAS_QCOM_WLAN 		:= true
BOARD_WLAN_DEVICE 		:= qcwcn
BOARD_HOSTAPD_DRIVER 		:= NL80211
BOARD_HOSTAPD_PRIVATE_LIB 	:= lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER 	:= NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
HOSTAPD_VERSION 		:= VER_0_8_X
WIFI_DRIVER_FW_PATH_AP 		:= "ap"
WIFI_DRIVER_FW_PATH_P2P 	:= "p2p"
WIFI_DRIVER_FW_PATH_STA 	:= "sta"
WIFI_DRIVER_MODULE_ARG 		:= ""
WIFI_DRIVER_MODULE_NAME 	:= "wlan"
WIFI_DRIVER_MODULE_PATH 	:= "/system/lib/modules/wlan.ko"
WPA_SUPPLICANT_VERSION 		:= VER_0_8_X

# RIL
#BOARD_RIL_CLASS := ../../../device/zte/warp4/ril

# GPS
BOARD_HAVE_NEW_QC_GPS := true

# Vold
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 30
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"

# External apps on SD
TARGET_EXTERNAL_APPS = sdcard1

#BOARD_USES_SECURE_SERVICES := true
#BOARD_USES_EXTRA_THERMAL_SENSOR := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

#BOARD_SEPOLICY_DIRS += \
#    device/zte/warp4/sepolicy

#BOARD_SEPOLICY_UNION += \
#     file_contexts \
#     init_shell.te \
#     mediaserver.te \
#     mm-qcamerad.te \
#     mpdecision.te \
#     netd.te \
#     system_app.te \
#     system_server.te \
#     tee.te \
#     thermal-engine.te \
#     time_daemon.te \
#     ueventd.te


# Recovery
BOARD_KERNEL_RECOVERY_CMDLINE      := $(BOARD_KERNEL_CMDLINE)
TARGET_RECOVERY_FSTAB := device/zte/warp4/ramdisk/fstab.qcom
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_LARGE_FILESYSTEM := true

#CWM
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_SECURE_ERASE := true

#TWRP
#RECOVERY_VARIANT := twrp
TW_TARGET_USES_QCOM_BSP := true
DEVICE_RESOLUTION := 720x1280
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_ALWAYS_RMRF := true
TW_CUSTOM_POWER_BUTTON := 107
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_NO_REBOOT_BOOTLOADER := true
#TW_NO_USB_STORAGE := true
TW_FLASH_FROM_STORAGE := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
#TW_NO_SCREEN_TIMEOUT := true
#TW_NO_SCREEN_BLANK := true
TW_INPUT_BLACKLIST := lis3dh_acc
