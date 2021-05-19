# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="fuse-libretro"
PKG_VERSION="e52a9eb4d094a1afc2af00fa7af51d891a4232a8"
PKG_SHA256="8ef9282b9c53ae02108c5fd1f955200fb184c99d4608bfc9c6cc5823ffd4ddbe"
PKG_LICENSE="GPL-3.0-or-later"
PKG_SITE="https://github.com/libretro/fuse-libretro"
PKG_URL="https://github.com/libretro/fuse-libretro/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="fuse-libretro is an work in progress port of the Fuse Unix Spectrum Emulator to libretro."
PKG_BUILD_FLAGS="+lto -sysroot"

PKG_LIBNAME="fuse_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
