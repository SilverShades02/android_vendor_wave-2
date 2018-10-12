# Versioning System
WAVE_BASE_VERSION = v1.0

ifndef WAVE_BUILD_TYPE
    WAVE_BUILD_TYPE := UNOFFICIAL
endif

TARGET_PRODUCT_SHORT := $(subst wave_,,$(WAVE_BUILD_TYPE))

# Set all versions
DATE := $(shell date -u +%Y%m%d)
WAVE_VERSION := $(TARGET_PRODUCT)-$(WAVE_BASE_VERSION)-$(DATE)-$(shell date -u +%H%M)-$(WAVE_BUILD_TYPE)
TARGET_BACON_NAME := $(WAVE_VERSION)
ROM_FINGERPRINT := WaveOS/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%H%M)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.wave.version=$(WAVE_VERSION) \
    ro.mod.version=$(WAVE_BUILD_TYPE)-$(WAVE_BASE_VERSION)-$(DATE)
    ro.wave.fingerprint=$(ROM_FINGERPRINT)
