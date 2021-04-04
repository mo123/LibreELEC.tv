# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="uae"
PKG_VERSION="86ed90068bc98a4ab3feebb54bd10da3a580af0b"
PKG_SHA256="9a40fb1bb126bb659ded72fccd9981e6385e6c1e995cdca1ed1817e1a60eb5c5"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/libretro/libretro-uae"
PKG_URL="https://github.com/libretro/libretro-uae/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Libretro wrapper for UAE emulator."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-sysroot"

PKG_LIBNAME="puae_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

pre_configure_target() {
  if [ "${ARCH}" = "arm" ]; then
    PKG_MAKE_OPTS_TARGET+=" platform=armv"

    # ARM NEON support
    if target_has_feature neon; then
      PKG_MAKE_OPTS_TARGET+="-neon"
    fi
  fi
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
