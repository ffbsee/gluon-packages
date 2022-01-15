include $(TOPDIR)/rules.mk

PKG_NAME:=ffbsee-authorized-keys
PKG_VERSION:=0.1

include $(TOPDIR)/../package/gluon.mk

define Package/ffbsee-authorized-keys
  TITLE:=Fill /etc/dropbear/authorized_keys from site.conf on UI demand
  DEPENDS:=+gluon-core +gluon-lock-password
endef

define Package/ffbsee-authorized-keys/description
	This package adds/removes ssh keys for ffbsee support team access
  depending on configuration (default off)
endef

$(eval $(call BuildPackageGluon,ffbsee-authorized-keys))
