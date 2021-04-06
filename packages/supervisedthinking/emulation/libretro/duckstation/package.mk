# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="duckstation"
PKG_VERSION="dfed054455180c4f993a0114806d9c28913625b3" #v0.1+
PKG_SHA256="bc22152e04868208e566d1021d9517373101813c9167ad86f64ec7590ca590bb"
PKG_LICENSE="GPL-3.0-or-later"
PKG_SITE="https://github.com/libretro/duckstation"
PKG_URL="https://github.com/libretro/duckstation/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="DuckStation is an simulator/emulator of the Sony PlayStation(TM) console, focusing on playability, speed, and long-term maintainability."
PKG_BUILD_FLAGS="-sysroot"

configure_package() {
  if [ ! "${ARCH}" = "arm" ]; then
    PKG_BUILD_FLAGS+=" +lto"
  fi
}

PKG_LIBNAME="duckstation_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-D BUILD_NOGUI_FRONTEND=OFF \
                         -D BUILD_QT_FRONTEND=OFF \
                         -D BUILD_LIBRETRO_CORE=ON \
                         -D ENABLE_DISCORD_PRESENCE=OFF \
                         -D USE_SDL2=OFF"
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
