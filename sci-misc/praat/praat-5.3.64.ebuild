# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit versionator
# FIXME: for versions with last part < 10 pad with zeroes
# e.g 4 => 4000, 5.1 => 5100, 5.2.7 => 5207.
MY_PV=$(delete_all_version_separators)

DESCRIPTION="Speech analysis and synthesis"
SRC_URI="http://www.fon.hum.uva.nl/praat/${PN}${MY_PV}_sources.tar.gz"
HOMEPAGE="http://www.fon.hum.uva.nl/praat/"

KEYWORDS="amd64 x86"
IUSE="+ipa"
LICENSE="GPL-2"
SLOT="0"

DEPEND="x11-libs/gtk+:2
	ipa? (
		media-fonts/sil-charis
		media-fonts/sil-doulos
	)"	

RDEPEND="${DEPEND}"

S="${WORKDIR}/sources_${MY_PV}"

src_prepare() {
	# TODO: following line should be updated for non-linux etc. builds
	# (Flammie does not have testing equipment)
	cp "${S}/makefiles/makefile.defs.linux.alsa" "${S}/makefile.defs"
}

src_install() {
	dobin praat
	dodir /usr/share/${PN}/test
	insinto /usr/share/${PN}/test
	doins test/*
}
