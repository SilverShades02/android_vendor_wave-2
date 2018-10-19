# Copyright (C) 2018 WaveOS
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

WAVE_MOD_VERSION = v9.0

ifndef WAVE_BUILD_TYPE
    WAVE_BUILD_TYPE := UNOFFICIAL
endif

ifeq ($(WAVE_BETA),true)
    WAVE_BUILD_TYPE := BETA
endif

ifeq ($(WAVE_ALPHA),true)
    WAVE_BUILD_TYPE := ALPHA
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

ifeq ($(WAVE_OFFICIAL),true)
   LIST = $(shell curl -s https://raw.githubusercontent.com/Wave-Project/android_vendor_wave/9.0/wave.devices) 
   FOUND_DEVICE = $(filter $(CURRENT_DEVICE), $(LIST))
    ifeq ($(FOUND_DEVICE),$(CURRENT_DEVICE))
      IS_OFFICIAL=true
      WAVE_BUILD_TYPE := OFFICIAL

    else
      WAVE_BUILD_TYPE := UNOFFICIAL
    endif
endif

WAVE_VERSION := Wave-$(WAVE_MOD_VERSION)-$(CURRENT_DEVICE)-$(WAVE_BUILD_TYPE)-$(shell date -u +%Y%m%d)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.wave.version=$(WAVE_VERSION) \
  ro.wave.releasetype=$(WAVE_BUILD_TYPE) \
  ro.mod.version=$(WAVE_MOD_VERSION)

WAVE_DISPLAY_VERSION := Wave-$(WAVE_MOD_VERSION)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.wave.display.version=$(WAVE_DISPLAY_VERSION)
