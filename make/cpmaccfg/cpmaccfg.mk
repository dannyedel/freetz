PACKAGE_LC:=cpmaccfg
PACKAGE_UC:=CPMACCFG
$(PACKAGE_UC)_VERSION:=0.4
$(PACKAGE_INIT_BIN)
$(PACKAGE_UC)_SOURCE:=cpmaccfg-$($(PACKAGE_UC)_VERSION).tar.gz
$(PACKAGE_UC)_SITE:=http://www.heimpold.de/dsmod
$(PACKAGE_UC)_BINARY:=$($(PACKAGE_UC)_DIR)/cpmaccfg
$(PACKAGE_UC)_TARGET_BINARY:=$($(PACKAGE_UC)_TARGET_DIR)/root/sbin/cpmaccfg


$(PACKAGE_SOURCE_DOWNLOAD)
$(PACKAGE_UNPACKED)
$(PACKAGE_CONFIGURED_CONFIGURE)

$($(PACKAGE_UC)_BINARY): $($(PACKAGE_UC)_DIR)/.configured
	PATH="$(TARGET_PATH)" \
		$(MAKE) -C $(CPMACCFG_DIR)

$($(PACKAGE_UC)_TARGET_BINARY): $($(PACKAGE_UC)_BINARY)
	mkdir -p $(dir $@)
	$(INSTALL_BINARY_STRIP)

cpmaccfg:

cpmaccfg-precompiled: uclibc cpmaccfg $($(PACKAGE_UC)_TARGET_BINARY)

cpmaccfg-clean:
	-$(MAKE) -C $(CPMACCFG_DIR) clean
	$(RM) $(CPMACCFG_DIR)/.configured

cpmaccfg-dirclean:
	$(RM) -r $(CPMACCFG_DIR)
	$(RM) -r $(CPMACCFG_TARGET_DIR)

cpmaccfg-uninstall:
	$(RM) $(CPMACCFG_TARGET_BINARY)

$(PACKAGE_FINI)
