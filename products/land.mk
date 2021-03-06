#
# Copyright (C) 2016 The CyanogenMod Project
#               2017 The LineageOS Project
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

# Inherit device path
$(call inherit-product, device/xiaomi/land/DevicePath.mk)

# Define platform before including any common things
$(call inherit-product, device/xiaomi/land/PlatformConfig.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common CarbonROM stuff.
$(call inherit-product, vendor/pure/configs/pure_phone.mk)
#$(call inherit-product, vendor/carbon/config/gsm.mk)

# Inherit from land device
$(call inherit-product, device/xiaomi/land/device.mk)

PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := land
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_NAME := land
WITH_SU="true"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

TARGET_VENDOR_PRODUCT_NAME := land

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Xiaomi/land/land:6.0.1/MMB29M/V8.2.5.0.MALMIDL:user/release-keys \
    PRIVATE_BUILD_DESC="land-user 6.0.1 MMB29M V8.2.5.0.MALMIDL release-keys"

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.product.model
