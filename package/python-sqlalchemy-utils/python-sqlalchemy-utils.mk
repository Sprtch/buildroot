################################################################################
#
# python-sqlalchemy-utils
#
################################################################################

PYTHON_SQLALCHEMY_UTILS_VERSION = 0.36.8
PYTHON_SQLALCHEMY_UTILS_SOURCE = SQLAlchemy-Utils-$(PYTHON_SQLALCHEMY_UTILS_VERSION).tar.gz
PYTHON_SQLALCHEMY_UTILS_SITE = https://files.pythonhosted.org/packages/14/68/e5301c4c960c79a32333b8805e52cb69d3d237aa869a773b4157ccb3eb26
PYTHON_SQLALCHEMY_UTILS_LICENSE = BSD
PYTHON_SQLALCHEMY_UTILS_LICENSE_FILES = LICENSE
PYTHON_SQLALCHEMY_UTILS_SETUP_TYPE = setuptools

$(eval $(python-package))
