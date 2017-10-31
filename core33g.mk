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

LOCAL_PATH := device/samsung/core33g

# Inherit from AOSP product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from sprd-common device configuration
$(call inherit-product, device/samsung/sprd-common/common.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Inherit from vendor tree
$(call inherit-product-if-exists, vendor/samsung/core33g/core33g-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Keylayouts
KEYLAYOUT_FILES := \
	$(LOCAL_PATH)/keylayouts/sci-keypad.kl \
	$(LOCAL_PATH)/keylayouts/samsung-keypad.kl \
	$(LOCAL_PATH)/keylayouts/ist30xx_ts_input.kl

PRODUCT_COPY_FILES += \
	$(foreach f,$(KEYLAYOUT_FILES),$(f):system/usr/keylayout/$(notdir $(f)))

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Media config
MEDIA_CONFIGS := \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_CONFIGS),$(f):system/etc/$(notdir $(f)))

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/media/mediaserver.rc:system/etc/init/mediaserver.rc

PRODUCT_PACKAGES += \
	media_codecs.xml \
	media_profiles.xml

# Bluetooth
PRODUCT_PACKAGES += \
	bt_vendor.conf \
	libbluetooth_jni \
	bluetooth.default

# HWC
PRODUCT_PACKAGES += \
	libHWCUtils \
	gralloc.sc8830 \
	hwcomposer.sc8830 \
	sprd_gsp.sc8830 \
	libmemoryheapion \
	libion_sprd

# Codecs
PRODUCT_PACKAGES += \
	libcolorformat_switcher \
	libstagefrighthw \
	libstagefright_sprd_mpeg4dec \
	libstagefright_sprd_mpeg4enc \
	libstagefright_sprd_h264dec \
	libstagefright_sprd_h264enc \
	libstagefright_sprd_vpxdec \
	libstagefright_sprd_aacdec \
	libstagefright_sprd_mp3dec

# Lights
PRODUCT_PACKAGES += \
	lights.sc8830

# Audio
PRODUCT_PACKAGES += \
	audio_hw.xml \
	audio_para \
	audio_effects_vendor.conf \
	audio_policy.conf \
	codec_pga.xml \
	tiny_hw.xml \
	audio.primary.sc8830 \
	libaudio-resampler \
	libatchannel_wrapper

# Common libs
PRODUCT_PACKAGES += \
	libstlport \
	librilutils \
	libril_shim \
	libgps_shim

# Rootdir files
PRODUCT_PACKAGES += \
	fstab.sc8830 \
	init.board.rc \
	init.core33g_base.rc \
	init.sc8830.rc \
	init.sc8830.usb.rc \
	init.wifi.rc \
	ueventd.sc8830.rc

# GPS
PRODUCT_PACKAGES += \
	gps.xml

# FM radio
PRODUCT_PACKAGES += \
	fm.sc8830

# Wifi
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/firmware/bcm4343/device-bcm.mk)

PRODUCT_PACKAGES += \
	macloader \
	wpa_supplicant.conf \
	nvram_net.txt \
	nvram_mfg.txt

# PowerHAL
PRODUCT_PACKAGES += \
	power.sc8830

# Packages
#PRODUCT_PACKAGES += \
#	SamsungDoze \
#	Gello \
#	Snap

# Permissions
PERMISSIONS_XML_FILES := \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.software.midi.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(PERMISSIONS_XML_FILES),$(f):system/etc/permissions/$(notdir $(f)))

# System init .rc files
PRODUCT_PACKAGES += \
	at_distributor.rc \
	chown_service.rc \
	data.rc \
	dns.rc \
	engpc.rc \
	gpsd.rc \
	healthd.rc \
	hostapd.rc \
	kill_phone.rc \
	macloader.rc \
	mediacodec.rc \
	modem_control.rc \
	modemd.rc \
	nvitemd.rc \
	p2p_supplicant.rc \
	phoneserver.rc \
	refnotify.rc \
	rild.rc \
	set_mac.rc \
	smd_symlink.rc \
	swap.rc \
	wpa_supplicant.rc

# Camera config
PRODUCT_PROPERTY_OVERRIDES += \
	camera.disable_zsl_mode=1

# Languages
PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.locale.language=en \
	ro.product.locale.region=GB

# Device props
PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \
	ro.kernel.android.checkjni=0 \
	dalvik.vm.checkjni=false

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1

# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
#$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.sys.root_access=1 \
	persist.service.adb.enable=1

# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-flags=--no-watch-dog

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_core33g
PRODUCT_DEVICE := core33g
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SM-G360H
