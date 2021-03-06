# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools versionator

MY_PV="$(replace_version_separator 3 -)"
MY_PF="${PN}-${MY_PV}"
S=${WORKDIR}/${MY_PF}

DESCRIPTION="Use most socks-friendly applications with Tor"
HOMEPAGE="https://github.com/dgoulet/torsocks"
SRC_URI="https://github.com/dgoulet/torsocks/archive/v${MY_PV}.tar.gz -> ${MY_PF}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm x86"
IUSE="static-libs"

# We do not depend on tor which might be running on a different box
DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	# Disable tests requiring network access.
	local test
	for test in dns fd_passing getpeername; do
		sed -i -e "/^	test_${test} \\\\\$/d" tests/Makefile.am || \
			die "failed to disable network tests"
	done

	default
	eautoreconf
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_install() {
	default

	# Remove libtool .la files
	find "${D}" -name '*.la' -delete || die
}
