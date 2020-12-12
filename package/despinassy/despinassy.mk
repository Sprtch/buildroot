################################################################################
#
# despinassy
#
################################################################################

DESPINASSY_VERSION = 121625775f24437a8a0c6559b6a95ed9eeebb5ff
DESPINASSY_SOURCE = despinassy-$(DESPINASSY_VERSION).tar.gz
DESPINASSY_SITE = $(call github,Sprtch,despinassy,$(DESPINASSY_VERSION))
DESPINASSY_LICENSE = MIT
DESPINASSY_LICENSE_FILES = LICENSE
DESPINASSY_SETUP_TYPE = setuptools

$(eval $(python-package))
