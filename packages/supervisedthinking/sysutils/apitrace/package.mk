# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="apitrace"
PKG_VERSION="9.0"
PKG_SHA256="0eec81ba7d3799622336319785465a2982a0621898842517a07894d7e2aa18eb"
PKG_LICENSE="MIT"
PKG_SITE="https://apitrace.github.io/"
PKG_URL="https://github.com/apitrace/apitrace/archive/refs/tags/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain glibc libpng zlib Python3"
PKG_LONGDESC="Tools for tracing OpenGL, Direct3D, and other graphics APIs"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server"
  fi

  # Add depends for OpenGL / OpenGLES support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  elif [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  fi
}

pre_configure_target() {
  # Disable Qt5 GUI
  PKG_CMAKE_OPTS_TARGET="-DENABLE_GUI=off"

  if [ ! "${DISPLAYSERVER}" = "x11" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DENABLE_X11=off"
  fi
}
