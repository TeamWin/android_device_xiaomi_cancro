#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

uncompressed_ramdisk := $(PRODUCT_OUT)/ramdisk.cpio
$(uncompressed_ramdisk): $(INSTALLED_RAMDISK_TARGET)
	zcat $< > $@

DTBTOOL := $(LOCAL_PATH)/mkbootimg_dtb
KERNEL 	:= $(LOCAL_PATH)/kernel
DTB 		:= $(LOCAL_PATH)/dt.img

INSTALLED_BOOTIMAGE_TARGET 			:= $(PRODUCT_OUT)/boot.img
INSTALLED_RECOVERYIMAGE_TARGET 	:= $(PRODUCT_OUT)/recovery.img

# Overload bootimg generation: Same as the original, + --dt arg
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	# @echo ----- Making boot image ------
	# $(hide) mkbootimg --kernel $(PRODUCT_OUT)/kernel --ramdisk $(PRODUCT_OUT)/ramdisk.img --cmdline "$(BOARD_KERNEL_CMDLINE)" --base $(BOARD_KERNEL_BASE) --pagesize $(BOARD_KERNEL_PAGESIZE) $(BOARD_MKBOOTIMG_ARGS) -o $(INSTALLED_BOOTIMAGE_TARGET)
	@echo ----- Made boot image -------- $@
	$(hide) $(DTBTOOL) --kernel $(KERNEL) --ramdisk $(PRODUCT_OUT)/ramdisk.img --cmdline "$(BOARD_KERNEL_CMDLINE)" --base $(BOARD_KERNEL_BASE) --offset 0x2000000 --dt $(DTB) --pagesize 2048 --tags-addr 0x01E00000 -o $(INSTALLED_BOOTIMAGE_TARGET)
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo ----- Added DTB ------------------ $@
	
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
	$(recovery_ramdisk) \
	$(recovery_kernel)
	# @echo ----- Making recovery image ------
	# $(hide) mkbootimg --kernel $(PRODUCT_OUT)/kernel --ramdisk $(PRODUCT_OUT)/ramdisk-recovery.img --cmdline "$(BOARD_KERNEL_CMDLINE)" --base $(BOARD_KERNEL_BASE) --pagesize $(BOARD_KERNEL_PAGESIZE) $(BOARD_MKBOOTIMG_ARGS) -o $(INSTALLED_RECOVERYIMAGE_TARGET)
	@echo ----- Made recovery image -------- $@
	$(hide) $(DTBTOOL) --kernel $(KERNEL) --ramdisk $(PRODUCT_OUT)/ramdisk-recovery.img --cmdline "console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37" --base 0x00000000 --offset 0x2000000 --dt $(DTB) --pagesize 2048 --tags-addr 0x01E00000 -o $(PRODUCT_OUT)/recovery.img
	@echo ----- Added DTB ------------------ $@
