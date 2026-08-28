# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils

DESCRIPTION="Quick, simple but powerful Cross Platform image editor."
HOMEPAGE="https://photoflare.io"
SRC_URI="https://github.com/PhotoFlare/${PN}/archive/v${PV}.tar.gz"

S="${WORKDIR}/${P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"

IUSE="+extra"

RDEPEND="virtual/libc
	media-gfx/graphicsmagick
	llvm-runtimes/openmp
	dev-qt/qtbase:6
	extra? ( dev-qt/qtimageformats:6 )
	"

DEPEND="|| ( sys-devel/gcc sys-devel/clang )
	${RDEPEND}"

src_configure() {
	qmake Photoflare.pro PREFIX=/usr
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}

pkg_postinst()
{
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
