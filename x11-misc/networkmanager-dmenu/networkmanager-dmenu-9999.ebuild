# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit git-r3

EGIT_REPO_URI="https://github.com/firecat53/networkmanager-dmenu.git"

DESCRIPTION="Manage NetworkManager connections with dmenu instead of nm-applet"
HOMEPAGE='https://github.com/firecat53/nmcli-dmenu'
LICENSE='MIT'

SLOT=0

RDEPEND='dev-lang/python
         dev-python/pygobject
         x11-misc/dmenu'

src_install() {
	dobin 'networkmanager_dmenu'
}
