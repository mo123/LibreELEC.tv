# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="RTL8723DS"
PKG_VERSION="f3167881f4668da0fb7f3d5c90746ff64e1c6633"
PKG_SHA256="09115949312b35b2f80c840db74b2f2f724f41badde084ccb72481c18552d104"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/lwfinger/rtl8723ds"
PKG_URL="https://github.com/lwfinger/rtl8723ds/archive/${PKG_VERSION}.tar.gz"
PKG_LONGDESC="Realtek RTL8723DS Linux 5.x driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=${TARGET_KERNEL_ARCH} \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=${TARGET_KERNEL_PREFIX} \
       CONFIG_POWER_SAVING=n
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
    cp *.ko ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
}
