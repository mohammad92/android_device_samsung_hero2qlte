LOCAL_PATH := $(call my-dir)

TEMP_TWRP_DIR := $(LOCAL_PATH)/temporary-twrp
INST_DIR := $(PRODUCT_OUT)/temporary-twrp
TEMP_TWRP_TARGET ?= $(PRODUCT_OUT)/temporary-twrp.zip

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_kernel) $(recovery_ramdisk)
	@echo -e ${CL_GRN}"----- Making recovery image ------"${CL_RST}
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) --output $@ --ramdisk $(recovery_ramdisk)
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}
	@echo -e ${CL_GRN}"\nZip temporary-twrp files..."${CL_RST}
	$(hide) rm -rf $(INST_DIR)
	@echo -e ${CL_GRN}"----- Copying files ------"${CL_RST}
	$(hide) cp -R $(TEMP_TWRP_DIR) $(PRODUCT_OUT)/
	$(hide) cp -a $(PRODUCT_OUT)/ramdisk-recovery.img $(INST_DIR)/
	$(hide) rm -f $(TEMP_TWRP_TARGET)
	$(hide) cd $(INST_DIR) && zip -qr $(TEMP_TWRP_TARGET) *
	@echo -e ${CL_CYN}"Made temporary-twrp zip : ${TEMP_TWRP_TARGET}"${CL_RST}
