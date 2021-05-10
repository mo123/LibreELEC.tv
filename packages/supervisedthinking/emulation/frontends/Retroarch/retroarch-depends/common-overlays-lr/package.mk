# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="common-overlays-lr"
PKG_VERSION="c543bb3c3a1a72be88f829d66966bc5b36fc86b3"
PKG_SHA256="9baf13b24f9e8fb180b516c9205bdd2f50408a086045523f9722896abb153f65"
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
