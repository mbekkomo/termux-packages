TERMUX_PKG_HOMEPAGE=https://lune-org.github.io/docs
TERMUX_PKG_DESCRIPTION="A standalone Luau runtime"
TERMUX_PKG_LICENSE="MPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.8.5
TERMUX_PKG_SRCURL=https://github.com/lune-org/lune/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=ed272b39ca8d14312d4ae5270165d689465594595fcbe0be6d324056cdc0daa9
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_configure() {
	termux_setup_cmake
	termux_setup_rust
}

termux_step_make() {
	export ANDROID_NDK_HOME="$NDK"
	cargo build -vv --all-features --jobs "${TERMUX_MAKE_PROCESSES}" --target "${CARGO_TARGET_NAME}" --release
}

termux_step_make_install() {
	install -Dm700 -t "${TERMUX_PREFIX}/bin" "target/${CARGO_TARGET_NAME}/release/lune"
}
