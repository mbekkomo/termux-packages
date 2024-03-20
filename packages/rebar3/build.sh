# Skeleton build.sh script for new package.
# For reference about available fields, check the Termux Developer's Wiki page:
# https://github.com/termux/termux-packages/wiki/Creating-new-package

TERMUX_PKG_HOMEPAGE=https://rebar3.org
TERMUX_PKG_DESCRIPTION="A sophisticated build-tool for Erlang projects that follows OTP principles."
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=
TERMUX_PKG_SRCURL=https://github.com/erlang/rebar3/archive/refs/tags/3.22.1.tar.gz
TERMUX_PKG_SHA256=
TERMUX_PKG_DEPENDS="erlang"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true
