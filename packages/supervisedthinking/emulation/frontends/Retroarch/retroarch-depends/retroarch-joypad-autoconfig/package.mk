# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="retroarch-joypad-autoconfig"
PKG_VERSION="343ea73d58a9b69e89f8d7d5a90820952068ef33"
PKG_SHA256="37e9ba6476dc02d4da6ed6e1af34f48f5d5273ed968635c8db2d89aec6c2fa39"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/retroarch-joypad-autoconfig"
PKG_URL="https://github.com/libretro/retroarch-joypad-autoconfig/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="gcc:host"
PKG_LONGDESC="RetroArch joypad autoconfig files"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  cd ${PKG_BUILD}
  make install INSTALLDIR="${INSTALL}/usr/share/retroarch/autoconfig" DOC_DIR="${INSTALL}/usr/share/doc/retroarch-joypad-autoconfig"
}
