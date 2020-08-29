################################################################################
#
# python-flask-script
#
################################################################################

PYTHON_FLASK_SCRIPT_VERSION = 2.0.6
PYTHON_FLASK_SCRIPT_SOURCE = Flask-Script-$(PYTHON_FLASK_SCRIPT_VERSION).tar.gz
PYTHON_FLASK_SCRIPT_SITE = https://files.pythonhosted.org/packages/00/a4/cd587b2b19f043b65bf33ceda2f6e4e6cdbd0ce18d01a52b9559781b1da6
PYTHON_FLASK_SCRIPT_LICENSE = BSD
PYTHON_FLASK_SCRIPT_LICENSE_FILES = LICENSE
PYTHON_FLASK_SCRIPT_SETUP_TYPE = setuptools

$(eval $(python-package))
