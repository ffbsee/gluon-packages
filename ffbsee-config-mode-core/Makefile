# Copyright (C) 2012 Nils Schneider <nils at nilsschneider.net>
# This is free software, licensed under the Apache 2.0 license.

include $(TOPDIR)/rules.mk

PKG_NAME:=ffbsee-config-mode-core
PKG_VERSION:=0.2

include $(TOPDIR)/../package/gluon.mk

define Package/ffbsee-config-mode-core
  TITLE:=Configuration wizard for user friendly setup of new mesh nodes
  DEPENDS:=+gluon-setup-mode +gluon-web-model +gluon-config-mode-theme +uhttpd +libuhttpd-openssl +openssl-util
  PROVIDES:=gluon-config-mode-core
endef

define Package/ffbsee-config-mode-core/install
	$(Gluon/Build/Install)

	$(INSTALL_DIR) $(1)/lib/gluon/config-mode/view/ $(1)/lib/gluon/config-mode/www/static/
	$(LN) /lib/gluon/web/i18n $(1)/lib/gluon/config-mode/
	$(LN) /lib/gluon/web/view/{error,model} $(1)/lib/gluon/config-mode/view/
	$(LN) /lib/gluon/web/www/static/gluon-web-model.js $(1)/lib/gluon/config-mode/www/static/
endef

$(eval $(call BuildPackageGluon,ffbsee-config-mode-core))
