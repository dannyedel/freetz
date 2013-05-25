#
# Copyright (C) 2006-2007 OpenWrt.org
# Copyright (C) 2013 Freetz.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
KERNEL_VERSION:=$(call qstrip,$(FREETZ_KERNEL_VERSION))
KERNEL_LAYOUT:=$(call qstrip,$(FREETZ_KERNEL_LAYOUT))
AVM_VERSION:=$(call qstrip,$(FREETZ_AVM_VERSION_STRING))
KERNEL_DIR:=$(BUILD_DIR_BASE)/linux-$(KERNEL_LAYOUT)-$(AVM_VERSION)
KERNEL_SOURCE_DIR:=$(KERNEL_DIR)
KERNEL_HEADERS_DEVEL_DIR:=$(STAGING_DIR)/usr
KERNEL_HEADERS_DIR:=$(KERNEL_DIR)/include
KERNEL_TARGET_DIR:=kernel
KERNEL_MODULES_DIR:=$(KERNEL_TARGET_DIR)/modules-$(KERNEL_LAYOUT)-$(AVM_VERSION)

KERNEL_LINKING_FILES = \
	drivers/char/avm_new/linux_ar7wdt.h \
	drivers/char/avm_new/linux_avm_debug.h \
	drivers/char/avm_new/linux_avm_event.h \
	drivers/char/avm_new/linux_avm_led.h \
	drivers/char/avm_new/linux_avm_profile.h \
	drivers/char/avm_power/linux_avm_power.h \
	drivers/char/ubik2/linux_ubik2_debug.h \
	drivers/char/ubik2/linux_ubik2_interface.h \
	drivers/char/ubik2/linux_ubik2_ul.h \
	drivers/isdn/capi_oslib/linux_capi_oslib.h \
	drivers/isdn/capi_oslib/linux_new_capi.h \
	drivers/isdn/capi_oslib/linux_new_capi_debug.h \
	drivers/isdn/capi_oslib/linux_zugriff.h \
	drivers/net/avm_cpmac/linux_adm_reg.h \
	drivers/net/avm_cpmac/linux_ar_reg.h \
	drivers/net/avm_cpmac/linux_avm_cpmac.h

ifneq (,$(filter y,$(FREETZ_REPLACE_KERNEL) $(shell grep -qe '^FREETZ_MODULE_.*=y$$' $(TOPDIR)/.config && echo y)))
	TARGETS+=kernel
endif