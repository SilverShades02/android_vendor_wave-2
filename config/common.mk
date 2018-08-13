# Generic product
PRODUCT_NAME := wave
PRODUCT_BRAND := wave
PRODUCT_DEVICE := generic

  EXCLUDE_SYSTEMUI_TESTS := true

# version
include vendor/wave/config/version.mk

# Props
include vendor/wave/config/wave_props.mk

# Packages
include vendor/wave/config/packages.mk

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/wave/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/wave/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/wave/prebuilt/common/bin/50-wave.sh:system/addon.d/50-wave.sh \
    vendor/wave/prebuilt/common/bin/blacklist:system/addon.d/blacklist

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/wave/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/wave/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/wave/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif
