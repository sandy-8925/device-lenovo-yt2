include build/target/board/generic_x86_64_a/BoardConfig.mk

TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := false

# Device bootloader requires ramdisk to be present in the boot partition, so system-as-root isn't possible right now
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

BOARD_AVB_ENABLE := false

# system.img
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := 4096

# userdata.img
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12256784384
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

# boot.img
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216

BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728

BOARD_FLASH_BLOCK_SIZE := 2048

BOARD_KERNEL_CMDLINE += printk.devkmsg=on earlyprintk=vga loglevel=8
BOARD_KERNEL_CMDLINE += androidboot.hardware=yt2 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=01234567890123456789 androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware
BOARD_KERNEL_CMDLINE += vga=current i915.modeset=1 drm.vblankoffdelay=1 acpi_backlight=vendor i915.mipi_panel_id=3

# Uses efilinux bootloader (https://github.com/mfleming/efilinux) along with Intel’s kernelflinger (https://github.com/intel/kernelflinger/)
# Kernelflinger Android specific code is here(https://github.com/intel/kernelflinger/blob/master/libkernelflinger/android.c) and boot_params data structure used in that file are defined here(https://github.com/mfleming/efilinux/blob/master/loaders/bzimage/bzimage.h)
# Note: Links don't point to exact source code used in the device, but some of the base code is still the same

BOARD_BOOT_HEADER_VERSION := 0
BOARD_PAGESIZE := 2048
OS_VERSION := 9
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION) --pagesize $(BOARD_PAGESIZE) --os_version $(OS_VERSION)

TARGET_PREBUILT_KERNEL := $(TARGET_KERNEL_SOURCE)/arch/$(TARGET_KERNEL_ARCH)/boot/$(BOARD_KERNEL_IMAGE_NAME)
