################################################################################
#
# libsigc++
#
################################################################################

LIBSIGC_VERSION = 2.2.11
LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
LIBSIGC_DEPENDENCIES = host-m4
LIBSIGC_INSTALL_STAGING = YES
LIBSIGC_LICENSE = LGPLv2.1+
LIBSIGC_LICENSE_FILES = COPYING

define LIBSIGC_INSTALL_TARGET_FIXUP
	rm -rf $(TARGET_DIR)/usr/share/devhelp/books/libsigc++*
endef

LIBSIGC_POST_INSTALL_TARGET_HOOKS += LIBSIGC_INSTALL_TARGET_FIXUP

$(eval $(autotools-package))
