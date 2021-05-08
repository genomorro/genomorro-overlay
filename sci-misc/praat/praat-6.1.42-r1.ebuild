# Copyright 1999-2021 Gentoo Fou-ndation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="Speech analysis and synthesis"
SRC_URI="https://github.com/praat/praat/archive/v${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="http://www.fon.hum.uva.nl/praat/"

KEYWORDS="amd64 x86"
IUSE="alsa doc ipa jack pulseaudio +static-libs +X"
LICENSE="GPL-2"
SLOT="0"

DEPEND="alsa? ( media-libs/alsa-lib )
	ipa? (
		media-fonts/sil-charis
		media-fonts/sil-doulos
	)
	jack? ( virtual/jack )
	pulseaudio? ( media-sound/pulseaudio )
	X? ( x11-libs/gtk+:3 )
	!X? ( x11-libs/pango )"	

RDEPEND="${DEPEND}"

REQUIRED_USE="?? ( alsa jack pulseaudio )
	      alsa? ( static-libs X )
	      jack? ( static-libs X )
	      pulseaudio? ( X )
	      !static-libs? ( pulseaudio X )
	      !X? ( static-libs )"

S="${WORKDIR}/praat-${PV}"

src_prepare() {
    eapply_user
    if use X; then
	if use static-libs; then
	    if use pulseaudio; then
		cp "${S}/makefiles/makefile.defs.linux.pulse_static" "${S}/makefile.defs"
	    elif use jack; then
		cp "${S}/makefiles/makefile.defs.linux.jack" "${S}/makefile.defs"
	    elif use alsa; then
		cp "${S}/makefiles/makefile.defs.linux.alsa" "${S}/makefile.defs"
	    else
		cp "${S}/makefiles/makefile.defs.linux.silent" "${S}/makefile.defs"
	    fi
	elif use pulseaudio; then
	    cp "${S}/makefiles/makefile.defs.linux.pulse" "${S}/makefile.defs"
	fi
    else
	cp "${S}/makefiles/makefile.defs.linux.nogui" "${S}/makefile.defs"
    fi
    cat <<-EOF >> makefile.defs
		CFLAGS += ${CFLAGS}
		LDFLAGS += ${LDFLAGS}
		CXXFLAGS += ${CXXFLAGS}
	EOF
}

src_install() {
    if [ -e praat_nogui ]; then
	mv praat_nogui praat
    elif [ -e praat_static ]; then
	mv praat_static praat
    fi
    dobin praat
    if use doc; then
	dodir /usr/share/${PN}/test
	insinto /usr/share/${PN}/test
	doins test/*
    fi
}
