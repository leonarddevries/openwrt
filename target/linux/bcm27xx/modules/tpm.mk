
define KernelPackage/tpm-tis
  SUBMENU:=$(OTHER_MENU)
  TITLE:=TPM TIS 1.2 Interface / TPM 2.0 FIFO Interface
  DEPENDS:= +kmod-tpm
  KCONFIG:= CONFIG_TCG_TIS
  FILES:= \
    $(LINUX_DIR)/drivers/char/tpm/tpm_tis.ko \
    $(LINUX_DIR)/drivers/char/tpm/tpm_tis_core.ko
  AUTOLOAD:=$(call AutoLoad,20,tpm_tis,1)
endef

define KernelPackage/tpm-tis/description
	If you have a TPM security chip that is compliant with the
	TCG TIS 1.2 TPM specification (TPM1.2) or the TCG PTP FIFO
	specification (TPM2.0) say Yes and it will be accessible from
	within Linux.
endef

$(eval $(call KernelPackage,tpm-tis))




define KernelPackage/tpm-tis-spi
  SUBMENU:=$(OTHER_MENU)
  TITLE:=TPM SPI Support
  DEPENDS:= +kmod-tpm
  KCONFIG:= CONFIG_TCG_TIS_SPI
  FILES:= \
    $(LINUX_DIR)/drivers/char/tpm/tpm_tis_core.ko
    $(LINUX_DIR)/drivers/char/tpm/tpm_tis_spi.ko
  AUTOLOAD:=$(call AutoLoad,40,tpm_tis_spi,1)
endef

define KernelPackage/tpm-tis-spi/description
	This enables the TPM Interface Specification over SPI
endef

$(eval $(call KernelPackage,tpm-tis-spi))