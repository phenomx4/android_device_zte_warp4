$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/zte/warp4/warp4-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/warp4/overlay

# This device is xhdpi.
PRODUCT_AAPT_CONFIG := normal xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_LOCALES += xhdpi

# adb + root
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.allow.mock.location=0 \
	ro.adb.secure=0 \
	ro.debuggable=1

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Camera
PRODUCT_PACKAGES += \
    Snap

# GPS
PRODUCT_PACKAGES += \
    gps.msm8226

PRODUCT_PACKAGES += \
    wcnss_service \
    lib_driver_cmd_qcwcn \
    wpa_supplicant \
    hostapd \
    libbundlewrapper \
    libreverbwrapper \
    libvisualizer \
    libdownmix \
    libldnhncr \
    dtbToolCM \
    libshim_rmt_storage \
    libshim_gps \
    libcurl \
    libboringssl-compat \
    libxml2 \
    libstlport
    
# Light
PRODUCT_PACKAGES += \
    lights.msm8226

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8226 \
    gralloc.msm8226 \
    hwcomposer.msm8226 \
    memtrack.msm8226 \
    power.msm8226 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils

# Audio
PRODUCT_PACKAGES += \
	alsa.msm8226 \
	audio.a2dp.default \
    audio_policy.msm8226 \
	audio.primary.msm8226 \
	audio.usb.default \
	audio.r_submix.default \
	libaudio-resampler


# DSPManager
PRODUCT_PACKAGES += \
    DSPManager \
    audio_effects.conf \
    libcyanogen-dsp

# Apollo
PRODUCT_PACKAGES += \
    Apollo \

PRODUCT_PACKAGES += \
	libdivxdrmdecrypt \
	libstagefrighthw \
    libmm-omxcore \
    libOmxCore \
    libc2dcolorconvert \
    libOmxVdecHevc \
    libstagefrighthw \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc

# Power
PRODUCT_PACKAGES += \
	power.msm8226

PRODUCT_PACKAGES += \
	Torch \
	FloatSysPop \
	DeviceSettings

# Charger
PRODUCT_PACKAGES += \
    zte_charger \
    charger_res_images_zte

# STK
PRODUCT_PACKAGES += Stk

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# Live Wallpapers
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	VisualizationWallpapers \
	librs_jni

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.class_main.sh \
    init.ftm.rc \
    init.mdm.sh \
    init.offcharge.rc \
    init.qcom.class_core.sh \
    init.qcom.early_boot.sh \
    init.qcom.factory.sh \
    init.qcom.ftm.rc \
    init.qcom.rc \
    init.qcom.ril.sh \
    init.qcom.sh \
    init.qcom.ssr.sh \
    init.qcom.syspart_fixup.sh \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    init.target.rc \
    ueventd.qcom.rc \

#TWRP
#PRODUCT_COPY_FILES += \
#    device/zte/warp4/recovery/recovery.fstab:recovery/twrp.fstab

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/zte/warp4/prebuilt/system,system)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:/system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:/system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:/system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:/system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:/system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:/system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:/system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:/system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:/system/etc/permissions/android.hardwardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:/system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:/system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:/system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:/system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:/system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:/system/etc/permissions/android.hardware.compass.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:/system/etc/permissions/android.hardware.telephony.cdma.xml


# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)

$(call inherit-product-if-exists, vendor/zte/warp4/warp4-vendor.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=8
