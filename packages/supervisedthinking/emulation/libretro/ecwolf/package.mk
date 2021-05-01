# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="ecwolf"
PKG_VERSION="fe041979e5e51b2ca0c90bb40ea6acf79714c3c7"
PKG_SHA256="6fd15d3c209ac46175c9a7020fc2b1a5eda454fd21bd87a71caf84c009c73592"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/libretro/ecwolf"
PKG_URL="https://github.com/libretro/ecwolf/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Libretro port of ECWolf"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto -sysroot"

PKG_LIBNAME="ecwolf_libretro.so"
PKG_LIBPATH="src/libretro/${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET=" -C src/libretro GIT_VERSION=${PKG_VERSION:0:7}"

pre_make_target() {
  cd $PKG_BUILD
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
