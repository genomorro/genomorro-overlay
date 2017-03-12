# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils

DESCRIPTION="GTK3.20-compatible version of bitterologist's Numix Solarized from deviantart; forked off Numix, inspired by bitterologist."
HOMEPAGE="https://github.com/Ferdi265/numix-solarized-gtk-theme"

LICENSE="GPL-3+"
SLOT="0"

inherit git-r3
EGIT_REPO_URI="https://github.com/Ferdi265/numix-solarized-gtk-theme"
KEYWORDS="*"

DEPEND="
	x11-themes/gtk-engines-murrine
	dev-ruby/sass
	dev-libs/glib:2
	x11-libs/gdk-pixbuf
"
RDEPEND="${DEPEND}"

src_compile(){
	emake DESTDIR="${D}" || die
}

src_install() {
	emake DESTDIR="${D}" install || die
}
