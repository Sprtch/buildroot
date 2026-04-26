do_override = $(1)_OVERRIDE_SRCDIR = $$(BR2_EXTERNAL_SPRTCH_PATH)/src/$(2)
$(foreach override,$(notdir $(wildcard $(call qstrip,$(BR2_EXTERNAL_SPRTCH_PATH))/src/*)),\
	$(eval $(call do_override,$(call UPPERCASE,$(override)),$(override))))
