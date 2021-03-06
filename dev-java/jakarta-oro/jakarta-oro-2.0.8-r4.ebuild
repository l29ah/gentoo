# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

JAVA_PKG_IUSE="doc source examples"

inherit java-pkg-2 java-pkg-simple

MY_J=${PN%%-*}
MY_O=${PN##*-}

DESCRIPTION="A set of text-processing Java classes"
HOMEPAGE="http://jakarta.apache.org/oro/index.html"
SRC_URI="http://archive.apache.org/dist/${MY_J}/${MY_O}/${P}.tar.gz"

LICENSE="Apache-1.1"
SLOT="2.0"
KEYWORDS="~amd64 ~ppc64 ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

DEPEND=">=virtual/jdk-1.6"
RDEPEND=">=virtual/jre-1.6"

S="${WORKDIR}/${P}"

JAVA_SRC_DIR="src"

java_prepare() {
	java-pkg_clean
	mv src/java/examples examples || die
}

src_install() {
	java-pkg-simple_src_install
	use examples && java-pkg_doexamples examples
}
