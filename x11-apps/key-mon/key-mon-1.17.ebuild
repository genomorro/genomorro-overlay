# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit python-single-r1 eutils fdo-mime

DESCRIPTION="Keyboard Status Monitor"
HOMEPAGE="https://code.google.com/p/key-mon/"
SRC_URI="https://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	gnome-base/librsvg
	dev-python/pygtk:2
	dev-python/python-xlib
	x11-proto/recordproto
	x11-libs/gtk+:2"
RDEPEND="${DEPEND}"

pkg_setup() {
	python-single-r1_pkg_setup
}

src_install() {

	insinto /usr/share/${PN}
	doins -r src/*
	fperms 755 /usr/share/${PN}/${PN}
	dosym /usr/share/${PN}/${PN} /usr/bin/${PN}
	doman man/${PN}.1
	newdoc README.rst README
	domenu icons/${PN}.desktop

	insinto /usr/share/mime/packages/
	doins icons/${PN}.xpm
}

pkg_postinst() {
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update
	einfo
	elog "This ebuild is not supported by Gentoo, so"
	elog "please do not send any bugs at Gentoo's bugzilla."
	elog "If you need help, find it here:"
	elog "edgar_uriel84@NOSPAM.genomorro.name"
	elog ""
	einfo
}

pkg_postrm() {
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update
}
