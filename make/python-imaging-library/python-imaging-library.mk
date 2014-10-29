$(call PKG_INIT_BIN, 1.1.7)
$(PKG)_SOURCE:=Imaging-$($(PKG)_VERSION).tar.gz
$(PKG)_SOURCE_MD5:=fc14a54e1ce02a0225be8854bfba478e
$(PKG)_SITE:=http://effbot.org/downloads

$(PKG)_DIR:=$($(PKG)_SOURCE_DIR)/Imaging-$($(PKG)_VERSION)

$(PKG)_TARGET_BINARY:=$($(PKG)_DEST_DIR)$(PYTHON_SITE_PKG_DIR)/PIL/_imaging.so

$(PKG)_DEPENDS_ON += python freetype jpeg zlib

$(PKG)_REBUILD_SUBOPTS += FREETZ_PACKAGE_PYTHON_STATIC

$(PKG_SOURCE_DOWNLOAD)
$(PKG_UNPACKED)
$(PKG_CONFIGURED_NOP)

$($(PKG)_TARGET_BINARY): $($(PKG)_DIR)/.configured
	$(call Build/PyMod/PKG, PYTHON_IMAGING_LIBRARY, , TARGET_ARCH=$(FREETZ_TARGET_ARCH))
	$(RM) -r $(PYTHON_IMAGING_LIBRARY_DEST_DIR)/usr/bin
	(cd $(PYTHON_IMAGING_LIBRARY_DEST_DIR)$(PYTHON_SITE_PKG_DIR); mv PIL/PIL-*.egg-info .;)

$(pkg):

$(pkg)-precompiled: $($(PKG)_TARGET_BINARY)

$(pkg)-clean:
	$(RM) -r $(PYTHON_IMAGING_LIBRARY_DIR)/build

$(pkg)-uninstall:
	$(RM) -r \
		$(PYTHON_IMAGING_LIBRARY_DEST_DIR)$(PYTHON_SITE_PKG_DIR)/PIL \
		$(PYTHON_IMAGING_LIBRARY_DEST_DIR)$(PYTHON_SITE_PKG_DIR)/PIL.pth \
		$(PYTHON_IMAGING_LIBRARY_DEST_DIR)$(PYTHON_SITE_PKG_DIR)/PIL-*.egg-info

$(PKG_FINISH)
