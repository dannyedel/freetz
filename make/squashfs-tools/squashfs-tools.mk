$(call PKG_INIT_BIN, 3.4)
$(PKG)_PRJNAME:=squashfs
$(PKG)_DIR:=$($(PKG)_SOURCE_DIR)/$($(PKG)_PRJNAME)$($(PKG)_VERSION)
$(PKG)_SOURCE:=$($(PKG)_PRJNAME)$($(PKG)_VERSION).tar.gz
$(PKG)_SOURCE_MD5:=2a4d2995ad5aa6840c95a95ffa6b1da6
$(PKG)_SITE:=@SF/$($(PKG)_PRJNAME)

$(PKG)_DEPENDS_ON += zlib

# TODO:
# - (Re-)add support for LZMA compression, it's not used at the primary target model 7490.

$(PKG)_BUILD_DIR := $($(PKG)_DIR)/squashfs-tools

$(PKG)_BINARIES            := mksquashfs unsquashfs
$(PKG)_BINARIES_BUILD_DIR  := $($(PKG)_BINARIES:%=$($(PKG)_BUILD_DIR)/%)
$(PKG)_BINARIES_TARGET_DIR := $($(PKG)_BINARIES:%=$($(PKG)_DEST_DIR)/usr/bin/%)

ifneq ($(strip $(DL_DIR)/$(SQUASHFS_TOOLS_SOURCE)),$(strip $(DL_DIR)/$(SQUASHFS3_SOURCE)))
$(PKG_SOURCE_DOWNLOAD)
endif
$(PKG_UNPACKED)
$(PKG_CONFIGURED_NOP)

$($(PKG)_BINARIES_BUILD_DIR): $($(PKG)_DIR)/.configured
	$(SUBMAKE) -C $(SQUASHFS_TOOLS_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"

$($(PKG)_BINARIES_TARGET_DIR): $($(PKG)_DEST_DIR)/usr/bin/%: $($(PKG)_BUILD_DIR)/%
	$(INSTALL_BINARY_STRIP)

$(pkg):

$(pkg)-precompiled: $($(PKG)_BINARIES_TARGET_DIR)

$(pkg)-clean:
	-$(SUBMAKE) -C $(SQUASHFS_TOOLS_BUILD_DIR) clean

$(pkg)-uninstall:
	$(RM) $(SQUASHFS_TOOLS_BINARIES_TARGET_DIR)

$(PKG_FINISH)
