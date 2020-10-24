################################################################################
#
# erie
#
################################################################################

ERIE_VERSION = b85c4129e50218ab3329919266ae45dfd7910708
ERIE_SOURCE = erie-$(ERIE_VERSION).tar.gz
ERIE_SITE = $(call github,Sprtch,erie,$(ERIE_VERSION))
ERIE_LICENSE = MIT
ERIE_LICENSE_FILES = LICENSE
ERIE_SETUP_TYPE = setuptools

define SPRTCH_ERIE_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_sprtch_PATH)/package/erie/S99erie $(TARGET_DIR)/etc/init.d/S99erie
endef

$(eval $(python-package))
