# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils git-r3

DESCRIPTION="GTK3.20-compatible version of bitterologist's Numix Solarized from deviantart; forked off Numix, inspired by bitterologist."
HOMEPAGE="https://github.com/Ferdi265/numix-solarized-gtk-theme"

LICENSE="GPL-3+"
SLOT="0"

EGIT_REPO_URI="https://github.com/Ferdi265/numix-solarized-gtk-theme"
KEYWORDS="*"

DEPEND="
	dev-libs/glib:2
	dev-libs/libxml2
	dev-ruby/sass
	media-gfx/inkscape
	x11-libs/gdk-pixbuf
	x11-themes/gtk-engines-murrine
"
RDEPEND="
	x11-themes/gtk-engines-murrine
	x11-libs/gtk+:3
"

src_compile(){
	emake DESTDIR="${D}" || die
}

src_install() {
	emake DESTDIR="${D}" install || die
}
