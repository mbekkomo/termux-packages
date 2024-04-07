TERMUX_PKG_HOMEPAGE=https://rebar3.org
TERMUX_PKG_DESCRIPTION="A sophisticated build-tool for Erlang projects that follows OTP principles."
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=3.22.1
TERMUX_PKG_SRCURL=https://github.com/erlang/rebar3/archive/refs/tags/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=2855b5784300865d2e43cb7a135cb2bba144cf15214c619065b918afc8cc6eb9
TERMUX_PKG_DEPENDS="erlang"
TERMUX_PKG_BUILD_DEPENDS="erlang"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true

termux_step_make() {
	set -x
	export ERL_INCLUDE_PATH=""
	for path in "$TERMUX_PREFIX/lib/erlang/lib/"*; do
		ERL_INCLUDE_PATH+="$path/include;$path/ebin;"
	done
	escript bootstrap
	install -Dm755 -t "${TERMUX_PREFIX}/bin" rebar3
	set +x
}
