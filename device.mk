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

DEVICE_PACKAGE_OVERLAYS += \
    device/sony/tetra/overlay

SOMC_PLATFORM := tetra

SONY_ROOT:= device/sony/tetra/rootdir

# Device Specific Hardware
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml

# tetra init
PRODUCT_COPY_FILES += \
    device/sony/tetra/rootdir/ueventd.tetra.rc:root/ueventd.tetra.rc \
    device/sony/tetra/rootdir/init.tetra.rc:root/init.tetra.rc \
    device/sony/tetra/rootdir/init.tetra.pwr.rc:root/init.tetra.pwr.rc \
    device/sony/tetra/rootdir/init.tetra.usb.rc:root/init.tetra.usb.rc

# Keylayout
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# IDC
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/usr/idc/cyttsp4_mt.idc:system/usr/idc/cyttsp4_mt.idc


# Media
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/media_codecs.xml:system/etc/media_codecs.xml

# Lights
PRODUCT_PACKAGES += \
    lights.tetra

# Simple PowerHAL
PRODUCT_PACKAGES += \
    power.tetra

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.bcm_java

# GFX
PRODUCT_PACKAGES += \
    gralloc.bcm_java \

# GPS
PRODUCT_PACKAGES += \
    gps.bcm_java

# WLAN
PRODUCT_PACKAGES += \
    p2p_supplicant.conf \
    dhcpcd.conf \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Limit dex2oat threads to improve thermals
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-threads=2 \
    dalvik.vm.image-dex2oat-threads=2

# Wi-Fi interface name
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

# BT address
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/data/etc/bluetooth_bdaddr

PRODUCT_AAPT_CONFIG := small
PRODUCT_AAPT_PREBUILT_DPI := hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=280
