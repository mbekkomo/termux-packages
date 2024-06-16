TERMUX_PKG_HOMEPAGE=http://justinethier.github.io/cyclone
TERMUX_PKG_DESCRIPTION="A brand-new compiler that allows practical application development using R7RS Scheme"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.36.0
TERMUX_PKG_SRCURL=https://github.com/justinethier/cyclone-bootstrap/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=6b984f4cc336993306cfc3e6bd9e82f4fc1a008f3592d4e942b5de182f5fac20
TERMUX_PKG_DEPENDS="clang, libck, libandroid-complex-math"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_BLACKLISTED_ARCHES="arm" ## follows `libck` blacklist
TERMUX_PKG_UNDEF_SYMBOLS_FILES="all"

termux_step_pre_configure() {
	CFLAGS+=" -Wno-error=int-conversion"
	TERMUX_PKG_EXTRA_MAKE_ARGS="PREFIX=${TERMUX_PREFIX}"
}
