# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit autotools

DESCRIPTION="Royalty-free, highly versatile audio codec"
HOMEPAGE="http://opus-codec.org/"

if [[ ${PV} == *9999 ]] ; then
	inherit git-2
	EGIT_REPO_URI="git://git.opus-codec.org/${PN}.git"
elif [[ ${PV%_p*} != ${PV} ]] ; then # Gentoo snapshot
	SRC_URI="https://dev.gentoo.org/~lu_zero/${PN}/${P}.tar.xz"
else # Official release
	SRC_URI="http://downloads.xiph.org/releases/opus/${P}.tar.gz"
fi

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE="flac"

RDEPEND=">=media-libs/libogg-1.3.0
	 >=media-libs/opus-1.0.3
	 flac? ( >=media-libs/flac-1.1.3 )"
DEPEND="virtual/pkgconfig
	${RDEPEND}"

src_prepare() {
	default
	[[ ${PV} == *9999 ]] && eautoreconf
}

src_configure() {
	econf $(use_with flac)
}

src_install() {
	default
	find "${ED}" \( -name "*.a" -o -name "*.la" \) -delete || die
}
