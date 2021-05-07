# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="Speech analysis and synthesis"
SRC_URI="https://github.com/praat/praat/archive/v${PV}.tar.gz"
HOMEPAGE="http://www.fon.hum.uva.nl/praat/"

KEYWORDS="amd64 x86"
IUSE="doc +ipa +pulseaudio static-libs +X"
LICENSE="GPL-2"
SLOT="0"

DEPEND="ipa? (
		media-fonts/sil-charis
		media-fonts/sil-doulos
	)
	pulseaudio? ( media-sound/pulseaudio )
	static-libs? ( media-libs/alsa-lib )
	X? ( x11-libs/gtk+:3 )
	!X? ( x11-libs/pango )"	

RDEPEND="${DEPEND}"

S="${WORKDIR}/praat-${PV}"

src_prepare() {
    if use X; then
	if use static-libs; then
	    if use pulseaudio; then
		cp "${S}/makefiles/makefile.defs.linux.pulse_static" "${S}/makefile.defs"
	    else
		cp "${S}/makefiles/makefile.defs.linux.alsa" "${S}/makefile.defs"
	    fi
	else
	    if use pulseaudio; then
		cp "${S}/makefiles/makefile.defs.linux.pulse" "${S}/makefile.defs"
	    else
		cp "${S}/makefiles/makefile.defs.linux.silent" "${S}/makefile.defs"
	    fi
	fi
    else
	cp "${S}/makefiles/makefile.defs.linux.nogui" "${S}/makefile.defs"
    fi
    eapply_user
}

src_install() {
    if [ -e praat_nogui ]
    then
	mv praat_nogui praat
    elif [ -e praat_static ]
    then
	mv praat_static praat
    fi
    dobin praat
    if use doc; then
	dodir /usr/share/${PN}/test
	insinto /usr/share/${PN}/test
	doins test/*
    fi
}
