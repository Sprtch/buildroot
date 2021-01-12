################################################################################
#
# despinassy
#
################################################################################

DESPINASSY_VERSION = fb9e4d47806d7166e6a8e6bdaa2004e68e9e4213
DESPINASSY_SOURCE = despinassy-$(DESPINASSY_VERSION).tar.gz
DESPINASSY_SITE = $(call github,Sprtch,despinassy,$(DESPINASSY_VERSION))
DESPINASSY_LICENSE = MIT
DESPINASSY_LICENSE_FILES = LICENSE
DESPINASSY_SETUP_TYPE = setuptools

$(eval $(python-package))
