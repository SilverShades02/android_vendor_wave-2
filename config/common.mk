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
