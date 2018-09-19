ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/wave/config/BoardConfigQcom.mk
endif

include vendor/wave/config/BoardConfigKernel.mk

include vendor/wave/config/BoardConfigSoong.mk
