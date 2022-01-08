include $(TOPDIR)/rules.mk

PKG_NAME:=ffbsee-alfred
PKG_VERSION:=0.13
PKG_RELEASE:=1

PKG_MAINTAINER:=A. Binzxxxxxx <DEvil0000@users.noreply.github.com>
PKG_LICENSE:=MIT

include $(TOPDIR)/../package/gluon.mk

define Package/ffbsee-alfred
  TITLE:=The alfred scripts pushing data to the ffbsee map
  DEPENDS:=+gluon-alfred +sockread +micrond
endef

$(eval $(call BuildPackageGluon,ffbsee-alfred))
