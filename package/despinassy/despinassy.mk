################################################################################
#
# despinassy
#
################################################################################

DESPINASSY_VERSION = 27d21f2ae36e5149044bec79a6280f555980d2e7
DESPINASSY_SOURCE = despinassy-$(DESPINASSY_VERSION).tar.gz
DESPINASSY_SITE = $(call github,Sprtch,despinassy,$(DESPINASSY_VERSION))
DESPINASSY_LICENSE = MIT
DESPINASSY_LICENSE_FILES = LICENSE
DESPINASSY_SETUP_TYPE = setuptools

$(eval $(python-package))
