# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils

DESCRIPTION="A GTK, xfwm4, openbox-3, and GNOME-Shell based on the
Official Color Pallet Created by Ethan Schoonover."
HOMEPAGE="https://github.com/rtlewis88/rtl88-Themes"

SRC_URI="
	light? (
	       https://github.com/rtlewis88/rtl88-Themes/archive/Solarized-Light.zip
	       )
	dark? (
	      https://github.com/rtlewis88/rtl88-Themes/archive/Solarized-Dark.zip
	      https://github.com/rtlewis88/rtl88-Themes/archive/Solarized-Dark-gtk-theme-colorpack.zip
	      )
	icons? (
	       https://github.com/rtlewis88/rtl88-Themes/archive/Solarized-Colors-Iconpack.zip
	       )"

LICENSE="GPL-2 GPL-3"
SLOT="0"

MY_PN=""

KEYWORDS="*"
IUSE="dark light deluxe icons cursors gtk2"
REQUIRED_USE="|| ( dark light )"

DEPEND="x11-libs/gtk+:3
	gtk2? (
	      x11-themes/gtk-engines-murrine
	      )"
	      
RDEPEND="${DEPEND}
	cursors? (
		 !x11-themes/Solarized-Colors-Cursors
		 )
	icons? (
	       !x11-themes/rtl88-Themes-Solarized-Colors-Iconpack
	       )
	x11-libs/libX11
        x11-libs/libXcursor"

src_prepare() {
    if use icons ; then
	rm rtl88-Themes-Solarized-Colors-Iconpack/*.*
    fi
    if use dark ; then
	rm rtl88-Themes-Solarized-Dark-gtk-theme-colorpack/*.*
    fi
    eapply_user
}

S="${WORKDIR}"

src_install() {
    if use dark ; then
	insinto /usr/share/themes/
	# doins -r rtl88-Themes-Solarized-Dark/Solarized-Dark
	doins -r rtl88-Themes-Solarized-Dark-gtk-theme-colorpack/*
    fi
    if use light ; then
	insinto /usr/share/themes/
	doins -r rtl88-Themes-Solarized-Light/Solarized-Light
    fi
    if use deluxe ; then
	insinto /usr/share/icons/
	if use dark ; then
	    doins -r rtl88-Themes-Solarized-Dark/Solarized-Deluxe-Iconpack
	else
	    doins -r rtl88-Themes-Solarized-Light/Solarized-Deluxe-Iconpack
	fi
    fi
    if use icons ; then
	insinto /usr/share/icons/
	doins -r rtl88-Themes-Solarized-Colors-Iconpack/*
    fi
    if use cursors ; then
	insinto /usr/share/cursors/xorg-x11/
	if use dark ; then
	    doins -r rtl88-Themes-Solarized-Dark/Solarized-Colors-Cursors/*
	else
	    doins -r rtl88-Themes-Solarized-Light/Solarized-Colors-Cursors/*
	fi
    fi
}

pkg_postinst() {
	if use cursors ; then
		ewarn "If you can choose the cursors via lxappearence or similar"
		ewarn "just do:"
		ewarn "ln -s /usr/share/cursors/xorg-x11/{Black,Blue,Green,Orange,Red,Turquoise,Yellow}-Cursor /usr/share/icons/"
	fi
}
