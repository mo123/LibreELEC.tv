# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="RTL8723DU"
PKG_VERSION="9690f34fc2603d04b53432df4e3d6c282f3d1ca6"
PKG_SHA256="7457125ff85d66c281a2c0eb19bf0ee7a8b4798c7100a786052895b21b626eb7"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/lwfinger/rtl8723du"
PKG_URL="https://github.com/lwfinger/rtl8723du/archive/${PKG_VERSION}.tar.gz"
PKG_LONGDESC="Realtek RTL8723DU Linux 5.x driver"
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
