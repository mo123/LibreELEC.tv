# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="duckstation"
PKG_VERSION="e414aeb2571a80b2eda09535d7a279774294f0c7" #v0.1+
PKG_SHA256="1361895b32865a4d4c3d8f145bf250a73f7e99f15de79bc1ab8dc65700bda2f2"
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
