# Copyright (C) 2017 Pure Fusion OS
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


# Inherit AOSP device configuration for axon7
$(call inherit-product, device/zte/axon7/aosp_axon7.mk)

# Set those variables here to overwrite the inherited values.

PRODUCT_DEVICE := axon7
PRODUCT_NAME := axon7
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := ZTE AXON 7
PRODUCT_MANUFACTURER := ZTE
PRODUCT_RELEASE_NAME := axon7

TARGET_VENDOR := zte

