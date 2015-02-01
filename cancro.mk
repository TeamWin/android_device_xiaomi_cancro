#
# Copyright (C) 2014 The CyanogenMod Project
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

ifneq ($(QCPATH),)
$(call inherit-product-if-exists, $(QCPATH)/common/config/device-vendor.mk)
endif
# Common QCOM configuration tools
$(call inherit-product, device/qcom/common/Android.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Temporary workaround
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr/include)

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/dt.img:dt.img

# overlays
DEVICE_PACKAGE_OVERLAYS += device/xiaomi/cancro/overlay

# Config scripts
PRODUCT_PACKAGES += \
  init.qcom.sh \
  init.qcom.bt.sh \
  init.qcom.fm.sh \
  init.qcom.modem_links.sh \
  init.qcom.post_boot.sh \
  init.qcom.audio.sh \
  init.qcom.wifi.sh \
  hsic.control.bt.sh \
  qca6234-service.sh \
  usf_post_boot.sh 
  
# Ramdisk
PRODUCT_PACKAGES += \
  fstab.qcom \
  init.qcom.rc \
  init.qcom.usb.rc \
  init.target.rc \
  ueventd.qcom.rc

# Init configs
PRODUCT_PACKAGES += \
   init.class_main.sh \
   init.mdm.sh \
   init.qcom.class_core.sh \
   init.qcom.early_boot.sh \
   init.qcom.factory.sh \
   init.qcom.sh \
   init.qcom.ssr.sh \
   init.qcom.syspart_fixup.sh \
   init.qcom.usb.sh 

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/acdb/MTP_Bluetooth_cal.acdb:system/etc/acdbdata/MTP/MTP_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_General_cal.acdb:system/etc/acdbdata/MTP/MTP_General_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Global_cal.acdb:system/etc/acdbdata/MTP/MTP_Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Handset_cal.acdb:system/etc/acdbdata/MTP/MTP_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Hdmi_cal.acdb:system/etc/acdbdata/MTP/MTP_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Headset_cal.acdb:system/etc/acdbdata/MTP/MTP_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Speaker_cal.acdb:system/etc/acdbdata/MTP/MTP_Speaker_cal.acdb 
   
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio_policy.msm8974 \
    audio.primary.msm8974 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix
    
PRODUCT_PROPERTY_OVERRIDES += \
    persist.speaker.prot.enable=true \
    qcom.hw.aac.encoder=false \
    tunnel.audio.encode=false \
    persist.audio.init_volume_index=1 \
    audio.offload.buffer.size.kb=32 \
    av.offload.enable=true \
    audio.offload.gapless.enabled=false \
    audio.offload.disable=1 \
    use.voice.path.for.pcm.voip=true \
    media.aac_51_output_enabled=true \
    ro.qc.sdk.audio.ssr=false \
    ro.qc.sdk.audio.fluencetype=fluence \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=true \
    use.dedicated.device.for.voip=false \
    audio.offload.pcm.enable=false

#Enable more sensor
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.sensors.qmd=true \
    ro.qualcomm.sensors.smd=true \
    ro.qualcomm.sensors.cmc=true \
    ro.qualcomm.sensors.vmd=true \
    ro.qualcomm.sensors.gtap=true \
    ro.qualcomm.sensors.pedometer=true \
    ro.qualcomm.sensors.pam=true \
    ro.qualcomm.sensors.scrn_ortn=true \
    ro.qualcomm.sensors.georv=true \
    ro.qualcomm.sensors.game_rv=true \
    ro.qti.sdk.sensors.gestures=true \
    ro.qc.sensors.step_detector=true \
    ro.qc.sensors.step_counter=true \
    ro.qc.sensors.max_geomag_rotvec=true \
    debug.qualcomm.sns.hal=w \
    debug.qualcomm.sns.daemon=w \
    debug.qualcomm.sns.libsensor1=w

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

PRODUCT_PACKAGES += \
    libxml2

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8974 \
    gralloc.msm8974 \
    hwcomposer.msm8974 \
    memtrack.msm8974 \
    liboverlay
    
# GPS
PRODUCT_PACKAGES += \
    gps.msm8974

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/quipc.conf:system/etc/quipc.conf \
    $(LOCAL_PATH)/gps/sap.conf:system/etc/sap.conf
    
# IPC router config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config

# Media profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Media
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libdashplayer \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libstagefrighthw \
    qcmediaplayer

PRODUCT_BOOT_JARS += qcmediaplayer

# NFC
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# Power
PRODUCT_PACKAGES += \
    power.msm8974
    
# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8974

# Thermal config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine.conf:system/etc/thermal-engine-8974.conf

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# WiFi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv_x4.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_x4.bin \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv_x4lte.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_x4lte.bin \
    $(LOCAL_PATH)/wifi/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/wifi/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(LOCAL_PATH)/wifi/hostapd.conf:system/etc/hostapd/hostapd.conf \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# SoftAP
PRODUCT_PACKAGES += \
    libwcnss_qmi \
    wcnss_service

# Kernel Modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/modules/radio-iris-transport.ko:system/lib/modules/radio-iris-transport.ko \
    $(LOCAL_PATH)/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    $(LOCAL_PATH)/modules/wlan.ko:system/lib/modules/wlan.ko

# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/libnfc-brcm-20791b05.conf:system/etc/libnfc-brcm-20791b05.conf

# NFC
PRODUCT_PACKAGES += \
    nfc_nci.bcm2079x.default \
    NfcNci \
    Tag

# IR package
PRODUCT_PACKAGES += \
    consumerir.msm8974

# Misc dependency packages
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    curl \
    libnl_2 \
    libbson \
    libcnefeatureconfig

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# proprietary wifi display, if available
ifneq ($(QCPATH),)
PRODUCT_BOOT_JARS += WfdCommon
endif

# Development settings
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.debuggable=1 \
    ro.adb.secure=0 \
    ro.secure=0

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qc_nlp_in_use=1 \
    persist.loc.nlp_name=com.qualcomm.services.location \
    ro.gps.agps_provider=1 \
    ro.qc.sdk.izat.premium_enabled=1 \
    ro.qc.sdk.izat.service_mask=0x5

PRODUCT_PROPERTY_OVERRIDES += \
    persist.rild.nitz_plmn="" \
    persist.rild.nitz_long_ons_0="" \
    persist.rild.nitz_long_ons_1="" \
    persist.rild.nitz_long_ons_2="" \
    persist.rild.nitz_long_ons_3="" \
    persist.rild.nitz_short_ons_0="" \
    persist.rild.nitz_short_ons_1="" \
    persist.rild.nitz_short_ons_2="" \
    persist.rild.nitz_short_ons_3=""

# strict operation
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.strict_op_enable=false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

# power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1

PRODUCT_CHARACTERISTICS := nosdcard

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.usb.hvdcp.detect=true \
    ro.nfc.port=I2C \
    ro.fm.transmitter=false \
    bluetooth.hfp.client=1 \
    persist.sys.root_access=1 \
    com.qc.hardware=true \
    qcom.bt.dev_power_class=1 \
    bluetooth.hfp.client=1 \
    ro.bluetooth.alwaysbleon=true \
    persist.demo.hdmirotationlock=false \
    ro.hdmi.enable=true \
    ro.qc.sdk.sensors.gestures=true \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    persist.hwc.mdpcomp.enable=true \
    debug.mdpcomp.logs=0 \
    debug.composition.type=dyn \
    ro.sf.lcd_density=480 \
    dev.pm.dyn_samplingrate=1 \
    ro.opengles.version=196608 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    wlan.driver.ath=0 \
    ril.subscription.types=RUIM \
    persist.omh.enabled=true \
    persist.sys.ssr.restart_level=3 \
    persist.timed.enable=true \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    persist.sys.strictmode.visual=0 \
    persist.sys.strictmode.disable=1 \
    media.stagefright.use-awesome=true \
    debug.mdpcomp.4k2kSplit=1

# Permissions
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.webview.xml:system/etc/permissions/android.software.webview.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

ifneq ($(QCPATH),)
$(call inherit-product-if-exists, $(QCPATH)/prebuilt_HY11/target/product/msm8974/prebuilt.mk)
endif

# call the proprietary setup
$(call inherit-product, vendor/xiaomi/cancro/cancro-vendor.mk)

