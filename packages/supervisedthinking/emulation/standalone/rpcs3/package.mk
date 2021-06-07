# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="rpcs3"
PKG_VERSION="5ca638162424f5634b465bc5e32a3fea7a8bbda5" # v0.0.15+
PKG_ARCH="x86_64"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://rpcs3.net"
PKG_URL="https://github.com/RPCS3/rpcs3.git"
PKG_DEPENDS_TARGET="toolchain linux glibc systemd pulseaudio llvm mesa openal-soft-system libevdev curl ffmpeg libpng zlib vulkan-loader glew-cmake libSM sdl2 enet-system qt-everywhere unclutter-xfixes"
PKG_LONGDESC="RPCS3 is an experimental open-source Sony PlayStation 3 emulator and debugger."
GET_HANDLER_SUPPORT="git"
PKG_BUILD_FLAGS="+lto"

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-D USE_NATIVE_INSTRUCTIONS=OFF \
                         -D BUILD_LLVM_SUBMODULE=ON \
                         -D CMAKE_C_FLAGS="${CFLAGS}" \
                         -D CMAKE_CXX_FLAGS="${CXXFLAGS}" \
                         -D LLVM_TARGET_ARCH="${TARGET_ARCH}" \
                         -D LLVM_TABLEGEN=${TOOLCHAIN}/bin/llvm-tblgen \
                         -D USE_DISCORD_RPC=OFF \
                         -D CMAKE_SKIP_RPATH=ON \
                         -D USE_SYSTEM_FFMPEG=ON \
                         -D USE_SYSTEM_LIBPNG=ON \
                         -D USE_SYSTEM_ZLIB=ON \
                         -D USE_SYSTEM_CURL=ON"

  # fix missing llvm/test subdir
  sed -e "/add_subdirectory(test)/d" -i ${PKG_BUILD}/llvm/CMakeLists.txt
}

pre_make_target() {
  # fix cross compiling
  find ${PKG_BUILD} -name flags.make  -exec sed -i "s:isystem :I:g" \{} \;
  find ${PKG_BUILD} -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
}

post_makeinstall_target() {
  # Copy scripts
  mkdir -p ${INSTALL}/usr/config/rpcs3
   cp ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/
   cp -PR ${PKG_DIR}/config/* ${INSTALL}/usr/config/rpcs3/
  
  # Clean up
  safe_remove ${INSTALL}/usr/share/applications
  safe_remove ${INSTALL}/usr/share/icons
  safe_remove ${INSTALL}/usr/share/metainfo
  safe_remove ${INSTALL}/usr/share/rpcs3/git
}
