# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4,3_5} pypy )

inherit distutils-r1

DESCRIPTION="A pure-Python WSGI server"
HOMEPAGE="http://docs.pylonsproject.org/projects/waitress/en/latest/ https://pypi.python.org/pypi/waitress/ https://github.com/Pylons/waitress"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 ~arm ~arm64 hppa ia64 ppc ppc64 ~s390 ~sh sparc x86 ~x86-fbsd"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	app-arch/unzip
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/nose[${PYTHON_USEDEP}] )"

src_prepare() {
	distutils-r1_src_prepare
}

python_test() {
	nosetests || die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	distutils-r1_python_install_all
}
