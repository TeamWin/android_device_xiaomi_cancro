## Specify phone tech before including full_phone

# Release name
PRODUCT_RELEASE_NAME := cancro

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/xiaomi/cancro/device_cancro.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := cancro
PRODUCT_NAME := lineage_cancro
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := MI 3W
PRODUCT_MANUFACTURER := Xiaomi
