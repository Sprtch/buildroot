export BR2_EXTERNAL := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

BR2_EXTERNAL_SPRTCH_PATH := $(BR2_EXTERNAL)
BR2_DL_DIR               := $(BR2_EXTERNAL_SPRTCH_PATH)/dl
export BR2_DL_DIR

OUTPUT_BASEDIR := $(BR2_EXTERNAL_SPRTCH_PATH)/output
CONFIGS_DIR    := $(BR2_EXTERNAL_SPRTCH_PATH)/configs
BUILDROOT_DIR  := $(BR2_EXTERNAL_SPRTCH_PATH)/buildroot

# List all the available defconfigs
CONFIGS := $(patsubst %_defconfig,%,$(notdir $(wildcard $(CONFIGS_DIR)/*_defconfig)))

# Persistant data across build:
# - CONFIG
-include $(OUTPUT_BASEDIR)/currentconfig

# Each config is stored under its own output.
MAKE_BUILDROOT := $(MAKE) -C $(BUILDROOT_DIR) O=$(OUTPUT_BASEDIR)/$(CONFIG)

# This target make it required to have an active config before using certain
# commands
.PHONY: _require_config
_require_config:
	@test -n "$(CONFIG)" || { \
		echo "Error: no active config. Run 'make <config>' first."; \
		echo "Available: $(CONFIGS)"; \
		exit 1; \
	}

# Bootstrap the config directory
.PHONY: $(CONFIGS)
$(CONFIGS): %:
	@mkdir -p $(OUTPUT_BASEDIR)/$*
	$(MAKE) -C $(BUILDROOT_DIR) O=$(OUTPUT_BASEDIR)/$* $*_defconfig
	@printf 'CONFIG ?= $*\n' > $(OUTPUT_BASEDIR)/currentconfig
	$(MAKE) -C $(BUILDROOT_DIR) O=$(OUTPUT_BASEDIR)/$*

.DEFAULT_GOAL := _build
.PHONY: _build
_build: _require_config
	$(MAKE_BUILDROOT)

# Command to write back the modified defconfig
.PHONY: defconfig
defconfig: _require_config
	$(MAKE_BUILDROOT) savedefconfig BR2_DEFCONFIG=$(CONFIGS_DIR)/$(CONFIG)_defconfig
	@echo "Saved => $(CONFIGS_DIR)/$(CONFIG)_defconfig"

# The usual buildroot commands are passed through
_KNOWN := $(CONFIGS) _build _require_config defconfig
_PASSTHROUGH := $(filter-out $(_KNOWN),$(MAKECMDGOALS))

ifneq ($(_PASSTHROUGH),)
.PHONY: $(_PASSTHROUGH)
$(_PASSTHROUGH): _require_config
	$(MAKE_BUILDROOT) $@
endif

.PHONY: help
help:
	@echo "Usage: make <target>"
	@echo
	@echo "Config targets (create output dir + build):"
	@$(foreach cfg,$(CONFIGS), echo "  $(cfg)";)
	@echo
	@echo "Build targets:"
	@echo "  (none)            Build active config"
	@echo "  defconfig         Write .config back to configs/<name>_defconfig"
	@echo
	@echo "Inspection:"
	@echo "  list-defconfigs   List all defconfigs"
	@echo
