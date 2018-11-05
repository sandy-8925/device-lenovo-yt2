$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_x86_64_a.mk)

PRODUCT_COPY_FILES := device/lenovo/yt2/config_files/fstab.hardware:system/etc/fstab.yt2

PRODUCT_NAME := aosp_yt2
PRODUCT_DEVICE := yt2
PRODUCT_BRAND := Android
PRODUCT_MODEL := Yoga Tab 2
PRODUCT_MANUFACTURER := Lenovo

PRODUCT_CHARACTERISTICS := tablet
PRODUCT_AAPT_CONFIG := normal
BUILD_ARM_FOR_X86 := true

TARGET_COPY_OUT_VENDOR := vendor
FIRMWARE_DIR_NAME := firmware
$(call inherit-product-if-exists, vendor/lenovo/yt2/vendor-blobs.mk)
