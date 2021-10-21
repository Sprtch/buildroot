################################################################################
#
# despinassy
#
################################################################################

DESPINASSY_VERSION = bcadb0d56e8e11a676aefd26a30de822ca03e04f
DESPINASSY_SOURCE = despinassy-$(DESPINASSY_VERSION).tar.gz
DESPINASSY_SITE = $(call github,Sprtch,despinassy,$(DESPINASSY_VERSION))
DESPINASSY_LICENSE = MIT
DESPINASSY_LICENSE_FILES = LICENSE
DESPINASSY_SETUP_TYPE = setuptools

$(eval $(python-package))
