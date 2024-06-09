TERMUX_PKG_HOMEPAGE=https://rebar3.org
TERMUX_PKG_DESCRIPTION="A sophisticated build-tool for Erlang projects that follows OTP principles."
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=3.23.0
TERMUX_PKG_SRCURL=https://github.com/erlang/rebar3/archive/refs/tags/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=00646b692762ffd340560e8f16486dbda840e1546749ee5a7f58feeb77e7b516
TERMUX_PKG_DEPENDS="erlang"
TERMUX_PKG_BUILD_DEPENDS="erlang"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true

termux_step_configure() {
	mkdir ~/.erl
	curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl
	chmod +x kerl
	export KERL_CONFIGURE_OPTIONS="--without-javac --without-wx"
	export KERL_USE_AUTOCONF=true
	CC=gcc CXX=g++ CFLAGS= LDFLAGS= ./kerl build-install 27.0 27.0 ~/.erl
	source ~/.erl/activate
}

termux_step_make() {
	escript bootstrap
}

termux_step_make_install() {
	install -Dm700 rebar3 "${TERMUX_PREFIX}/bin/rebar3"
}
