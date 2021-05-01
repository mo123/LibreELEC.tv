# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="common-overlays-lr"
PKG_VERSION="5ec925429119deb5b68e83af3b992f5a1d55e77d"
PKG_SHA256="80885527baf7d6901ef17c557b4f64fc8cbdec56360a42db6aeff61e10c0a4d7"
PKG_LICENSE="CC-BY-4.0 License"
PKG_SITE="https://github.com/libretro/common-overlays"
PKG_URL="https://github.com/libretro/common-overlays/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET=""
PKG_LONGDESC="Collection of overlay files for use with libretro frontends, such as RetroArch."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/retroarch/overlay
  cp -r ${PKG_BUILD}/borders ${INSTALL}/usr/share/retroarch/overlay
}
