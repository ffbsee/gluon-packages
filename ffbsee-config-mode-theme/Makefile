# Copyright (C) 2013 Nils Schneider <nils at nilsschneider.net>
# This is free software, licensed under the Apache 2.0 license.

include $(TOPDIR)/rules.mk

PKG_NAME:=ffbsee-config-mode-theme
PKG_VERSION:=0.3

include $(TOPDIR)/../package/gluon.mk

define Package/ffbsee-config-mode-theme
  TITLE:=ffbsee config mode theme for gluon-web
  DEPENDS:=+gluon-core +gluon-web
  PROVIDES:=gluon-config-mode-theme
endef

#dart sass is required, ruby sass sucks
$(shell sass --no-source-map --style compressed sass/gluon.scss files/lib/gluon/config-mode/www/static/gluon.css)
$(eval $(call BuildPackageGluon,ffbsee-config-mode-theme))
