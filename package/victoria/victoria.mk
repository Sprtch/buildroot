################################################################################
#
# victoria
#
################################################################################

VICTORIA_VERSION = 272a1b6d84d44b40efcfc16c6db3c723b918faff
VICTORIA_SOURCE = victoria-$(VICTORIA_VERSION).tar.gz
VICTORIA_SITE = $(call github,Sprtch,victoria,$(VICTORIA_VERSION))
VICTORIA_LICENSE = MIT
VICTORIA_LICENSE_FILES = LICENSE
VICTORIA_SETUP_TYPE = setuptools

define VICTORIA_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_sprtch_PATH)/package/victoria/S99victoria $(TARGET_DIR)/etc/init.d/S99victoria
endef

$(eval $(python-package))
