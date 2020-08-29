################################################################################
#
# huron
#
################################################################################

HURON_VERSION = 0.0.1
HURON_SITE = $(call github,Sprtch,huron,$(HURON_VERSION))
HURON_LICENSE = MIT
HURON_LICENSE_FILES = LICENSE

define HURON_BUILD_CMDS
	$(TARGET_MAKE_ENV) npm install --prefix $(@D)
	$(TARGET_MAKE_ENV) npm run build --prefix $(@D)
endef

define HURON_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(BR2_EXTERNAL_sprtch_PATH)/package/huron/nginx.conf \
		$(TARGET_DIR)/etc/nginx/nginx.conf
	$(INSTALL) -d $(TARGET_DIR)/www/huron
	$(INSTALL) -D -m 0644 $(@D)/requirements.txt $(TARGET_DIR)/www/huron/requirements.txt
	$(INSTALL) -D -m 0644 $(@D)/README.md $(TARGET_DIR)/www/huron/README.md
	$(INSTALL) -D -m 0644 $(@D)/setup.py $(TARGET_DIR)/www/huron/setup.py
	$(INSTALL) -D -m 0755 $(@D)/manage.py $(TARGET_DIR)/www/huron/manage.py
	cp -r $(@D)/build $(@D)/huron $(TARGET_DIR)/www/huron/
endef

define HURON_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_sprtch_PATH)/package/huron/S99gunicorn \
		$(TARGET_DIR)/etc/init.d/S99gunicorn
endef

$(eval $(generic-package))
