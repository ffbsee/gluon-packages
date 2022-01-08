include $(TOPDIR)/rules.mk

PKG_NAME:=ffbsee-cli-basics
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_MAINTAINER:=A. Binzxxxxxx <DEvil0000@users.noreply.github.com>
PKG_LICENSE:=MIT

include $(TOPDIR)/../package/gluon.mk

define Package/ffbsee-cli-basics
  TITLE:=This is a meta package to get some most wanted cli tools
  DEPENDS:=+nano
endef

$(eval $(call BuildPackageGluon,ffbsee-cli-basics))
