# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="flycast"
PKG_VERSION="ddb617aed135c4a084cf884770c7c80a7c883e34"
PKG_SHA256="3ce11c185a4f6b058fb66a609f8e4333dc540167d6c5d767d18a7799b9abbe5b"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/libretro/flycast"
PKG_URL="https://github.com/libretro/flycast/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Flycast is a multiplatform Sega Dreamcast emulator"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-sysroot"

PKG_LIBNAME="flycast_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="HAVE_OPENMP=0 GIT_VERSION=${PKG_VERSION:0:7}"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  fi

  # OpenGLES Support
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  fi
}

pre_configure_target() {
  case ${PROJECT} in
    Amlogic)
      PKG_MAKE_OPTS_TARGET+=" platform=${DEVICE}"
      ;;
    RPi)
      case ${DEVICE} in
        RPi)
          PKG_MAKE_OPTS_TARGET+=" platform=rpi"
          ;;
        RPi2)
          PKG_MAKE_OPTS_TARGET+=" platform=rpi2"
          ;;
        RPi4)
          PKG_MAKE_OPTS_TARGET+=" platform=rpi4"
          ;;
      esac
      ;;
    Rockchip)
      case ${DEVICE} in
        RK3328)
          PKG_MAKE_OPTS_TARGET+=" platform=RK3328"
          ;;
        RK3399)
          PKG_MAKE_OPTS_TARGET+=" platform=RK3399"
          ;;
        TinkerBoard|MiQi)
          PKG_MAKE_OPTS_TARGET+=" platform=RK3288"
          ;;
      esac
      ;;
    *)
      if [ "${ARCH}" = "arm" ]; then
        PKG_MAKE_OPTS_TARGET+=" platform=armv"
        # OpenGL ES support
        if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
          PKG_MAKE_OPTS_TARGET+="-gles"
        fi
        # ARM NEON support
        if target_has_feature neon; then
          PKG_MAKE_OPTS_TARGET+="-neon"
        fi
      else
        # OpenGL support
        if [ "${OPENGL_SUPPORT}" = "yes" ]; then
          PKG_MAKE_OPTS_TARGET+=" HAVE_OIT=1"
        fi
        # Vulkan support
        if [ "${VULKAN_SUPPORT}" = "yes" ]; then
          PKG_MAKE_OPTS_TARGET+=" HAVE_VULKAN=1"
        else
          PKG_MAKE_OPTS_TARGET+=" HAVE_VULKAN=0"
        fi
        # Set dynarec arch
        PKG_MAKE_OPTS_TARGET+=" WITH_DYNAREC=${ARCH}"
      fi
      ;;
  esac
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
