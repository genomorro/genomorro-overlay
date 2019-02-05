# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils

DESCRIPTION="GTK3.20-compatible version of bitterologist's Numix Solarized from deviantart; forked off Numix, inspired by bitterologist."
HOMEPAGE="https://github.com/Ferdi265/numix-solarized-gtk-theme"

LICENSE="GPL-3+"
SLOT="0"

MY_PN="NumixSolarized"

BASE_URI="https://github.com/Ferdi265/${PN}"

KEYWORDS="*"
SRC_URI="${BASE_URI}/releases/download/${PV}/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"

DEPEND="
	x11-libs/gtk+:3
	x11-themes/gtk-engines-murrine
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}"

src_install() {
	insinto /usr/share/themes/
	doins -r *
}
