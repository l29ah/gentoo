# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Virtual for cron"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~sparc-fbsd ~x86-fbsd"

RDEPEND="|| ( sys-process/vixie-cron
		sys-process/bcron
		sys-process/cronie
		sys-process/dcron
		sys-process/fcron )"
