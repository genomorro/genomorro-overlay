# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils

DESCRIPTION="This is the Icon and Folder set which goes with the
Solarized-Dark-COLORPACK desktop theme; and both are based on the
Official Color Pallet created by Ethan Schoonover"
HOMEPAGE="https://www.gnome-look.org/p/1309239/"

LICENSE="GPL-3+"
SLOT="0"

MY_PN="rtl88-Themes-Solarized-Colors-Iconpack"

KEYWORDS="*"
SRC_URI="https://github.com/rtlewis88/rtl88-Themes/archive/Solarized-Colors-Iconpack.zip"

DEPEND=""

RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}"

src_install() {
	insinto /usr/share/icons/
	doins -r *
}
