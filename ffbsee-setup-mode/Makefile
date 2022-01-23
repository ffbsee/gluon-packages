# Copyright (C) 2012 Nils Schneider <nils at nilsschneider.net>
# This is free software, licensed under the Apache 2.0 license.

include $(TOPDIR)/rules.mk

PKG_NAME:=ffbsee-setup-mode
PKG_VERSION:=0.31

include $(TOPDIR)/../package/gluon.mk

define Package/ffbsee-setup-mode
  TITLE:=ffbsee simple setup mode
  DEPENDS:=+gluon-core +gluon-lock-password +ubus +dnsmasq
  PROVIDES:=gluon-setup-mode
endef

define Package/ffbsee-setup-mode/description
	This package is based on the gluon-setup-mode.
	It will act the same for the first boot but every
	other time a button is pressed for config mode it
	will not reboot to a save mode but instead provide
	a config web UI with only lan/wifi (local) access
	via ffbsee nexthop 10.15.239.127 for a period of 1h.
endef

init_links := \
	K89log \
	K98boot \
	K99umount \
	S00sysfixtime \
	S10boot \
	S10gluon-core-reconfigure \
	S10system \
	S11sysctl \
	S12log \
	S95done

define Package/ffbsee-setup-mode/install
	$(Gluon/Build/Install)

	$(LN) S20network $(1)/lib/gluon/setup-mode/rc.d/K90network
	$(LN) S19firewall-adjustment $(1)/lib/gluon/setup-mode/rc.d/K91firewall-adjustment

	for link in $(init_links); do \
		$(LN) "/etc/init.d/$$$${link:3}" "$(1)/lib/gluon/setup-mode/rc.d/$$$${link}"; \
	done

	$(LN) /etc/rc.d/S19dnsmasq $(1)/lib/gluon/setup-mode/rc.d/S65dnsmasq
endef

$(eval $(call BuildPackageGluon,ffbsee-setup-mode))
