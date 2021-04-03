# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="munt"
PKG_VERSION="1f42d80d9a4f1b0d5a499b783b9c5808c24c1a3e" # libmt32emu 2.5.0
PKG_SHA256="80a577d985d21c6bb247e79c3342da3760527ae4f6f46fcb8809e2e7e96d4561"
PKG_LICENSE="LGPL-2.0-or-later"
PKG_SITE="https://github.com/munt/munt"
PKG_URL="https://github.com/munt/munt/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A software synthesiser emulating pre-GM MIDI devices such as the Roland MT-32."

PKG_CMAKE_OPTS_TARGET="-D munt_WITH_MT32EMU_QT=0 \
                       -D munt_WITH_MT32EMU_SMF2WAV=0 \
                       -D libmt32emu_SHARED=1"
