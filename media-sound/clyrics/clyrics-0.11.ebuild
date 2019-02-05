# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="An extensible lyrics fetcher, with daemon support for cmus and mocp."
HOMEPAGE="https://github.com/trizen/clyrics"
SRC_URI="https://github.com/trizen/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="+moc cmus"

RDEPEND="${DEPEND}
         moc? ( media-sound/moc )
         cmus? ( media-sound/cmus )"

DEPEND="dev-perl/WWW-Mechanize
	dev-perl/LWP-Protocol-https"

src_unpack() {
    unpack ${A}
}

src_install() {
    insinto /usr/bin/
    doins clyrics
    fperms 755 /usr/bin/${PN}

    insinto /usr/share/${PN}
    doins plugins/*
    for i in * ; do
	fperms 644 ${i}
    done

    dodoc LICENSE README.md
}

pkg_postinst() {
    einfo
    elog "This ebuild is not supported by Gentoo, so"
    elog "please do not send any bugs at Gentoo's bugzilla."
    elog "If you need help, find it here:"
    elog "edgar_uriel84@NOSPAM.genomorro.name"
    elog ""
    einfo
}
