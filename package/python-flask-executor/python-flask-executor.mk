################################################################################
#
# python-flask-executor
#
################################################################################

PYTHON_FLASK_EXECUTOR_VERSION = 0.9.3
PYTHON_FLASK_EXECUTOR_SOURCE = Flask-Executor-$(PYTHON_FLASK_EXECUTOR_VERSION).tar.gz
PYTHON_FLASK_EXECUTOR_SITE = https://files.pythonhosted.org/packages/42/45/40e2abc7dbe88f0e45c5f35fe2649ddcec7c9f38d4212c277cef77856cb9
PYTHON_FLASK_EXECUTOR_LICENSE = BSD
PYTHON_FLASK_EXECUTOR_LICENSE_FILES = LICENSE
PYTHON_FLASK_EXECUTOR_SETUP_TYPE = setuptools

$(eval $(python-package))
