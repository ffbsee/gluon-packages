include $(TOPDIR)/rules.mk

PKG_NAME:=ffbsee-wifiscan
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_MAINTAINER:=Wolf <wolf128058@users.noreply.github.com>
PKG_LICENSE:=MIT

include $(TOPDIR)/../package/gluon.mk

define Package/ffbsee-wifiscan
  TITLE:=The wifiscan-scripts generate a wifiscan-result-json-string
  DEPENDS:=+iw
endef

$(eval $(call BuildPackageGluon,ffbsee-wifiscan))
