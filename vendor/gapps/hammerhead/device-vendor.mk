LOCAL_STEM := hammerhead/device-partial.mk

$(call inherit-product-if-exists, vendor/broadcom/$(LOCAL_STEM))
$(call inherit-product-if-exists, vendor/lge/$(LOCAL_STEM))
$(call inherit-product-if-exists, vendor/qcom/$(LOCAL_STEM))
$(call inherit-product-if-exists, vendor/gapps/$(LOCAL_STEM))
