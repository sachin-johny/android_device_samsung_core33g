## Specify phone tech before including full_phone	
$(call inherit-product, vendor/pac/config/telephony.mk)

# Release name
PRODUCT_RELEASE_NAME := core33g

# Inherit some common PAC stuff.
$(call inherit-product, vendor/pac/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/core33g/device_core33g.mk)

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/pac/prebuilt/common/media/bootanimation/bootanimation.zip:system/media/bootanimation.zip

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := core33g
PRODUCT_NAME := pac_core33g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G360H
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone
