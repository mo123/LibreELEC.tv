
PKG_NAME="Remotectl"
PKG_SHA256="b44cec7cef7594156c9b80d12098a9c853369940a23796cc11b40bf078017187"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/cljidkx/Remotectl"
PKG_URL="https://github.com/cljidkx/Remotectl/archive/refs/tags/v1.0.tar.gz"
PKG_LONGDESC="ES8388 Linux 5.x driver"
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
