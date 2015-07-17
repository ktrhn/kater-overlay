# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils cmake-utils

DESCRIPTION="Replacement for libevent's current HTTP API."
HOMEPAGE="https://github.com/ellzey/libevhtp/"
SRC_URI="https://github.com/ellzey/libevhtp/archive/${PV}.zip -> ${PN}-${PV}.zip"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64"
IUSE="+shared +ssl"

DEPEND=">=dev-libs/libevent-2"
RDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DEVHTP_BUILD_SHARED=ON
		-DEVHTP_DISABLE_SSL=OFF
		$(cmake-utils_use !ssl EVHTP_DISABLE_SSL)
		$(cmake-utils_use shared EVHTP_BUILD_SHARED)
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
