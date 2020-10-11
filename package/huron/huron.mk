################################################################################
#
# huron
#
################################################################################

HURON_VERSION = 0f49e228425ceab3b1e5745d4653be0b1680bc8d
HURON_SITE = $(call github,Sprtch,huron,$(HURON_VERSION))
HURON_LICENSE = MIT
HURON_LICENSE_FILES = LICENSE
HURON_SETUP_TYPE = setuptools


define HURON_BUILD_FRONTEND
	$(TARGET_MAKE_ENV) npm install --prefix $(@D)
	$(TARGET_MAKE_ENV) npm run build --prefix $(@D)
endef

HURON_PRE_BUILD_HOOKS += HURON_BUILD_FRONTEND

define HURON_INSTALL_NGINX
	$(INSTALL) -D -m 0644 $(BR2_EXTERNAL_sprtch_PATH)/package/huron/nginx.conf \
		$(TARGET_DIR)/etc/nginx/nginx.conf
endef

HURON_POST_INSTALL_TARGET_HOOKS += HURON_INSTALL_NGINX

define HURON_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_sprtch_PATH)/package/huron/S99gunicorn \
		$(TARGET_DIR)/etc/init.d/S99gunicorn
endef

$(eval $(python-package))
