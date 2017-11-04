LOCAL_PATH := device/samsung/core33g

# Release name
PRODUCT_RELEASE_NAME := core33g

# Inherit some common CM stuff.
$(call inherit-product, vendor/cos/common.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/core33g.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := core33g
PRODUCT_NAME := cos_core33g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G360H
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone
