# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils

DESCRIPTION="Solarized-Deluxe Icons, with folders and cursors,
represent custom blended color and selections among the Sardi Ghost
Flexible, Papirus & ArchDroid schemes with Android Lollipop's material
design overlay."
HOMEPAGE="https://www.gnome-look.org/p/1312499/"

LICENSE="GPL-3"
SLOT="0"

KEYWORDS="*"

SRC_URI="https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1NzI3NjUzMjQiLCJ1IjoiNTcwMjM3IiwibHQiOiJkb3dubG9hZCIsInMiOiJmNjQ1OWE0YWEyNTc5MjUwYjM2MmZmMjY4NjMyMGVhNzFhYWZjM2MzZGQ2OTZjODRlYTRlNThhNzA1MGJhODEzNjZmNDNkOTU5MmIyMDQzMzRhZTVkOWM5MTE0Y2VkOTU0OGJiZTRlMTE5MGE0YmVlNzNlYzk3MTdiYzQxMDM0YiIsInQiOjE1ODc4NDQ0NjksInN0ZnAiOiI1OWNmYmRmYTQxYzVmNjk1Mzg2N2I3Zjk2MDgxY2E3NCIsInN0aXAiOiIyODA2OjEwNWU6MTc6ZDY4OjFmOWY6Y2RkODozOTJjOmJkOGMifQ.n7bxn7csj4XsGIKhGA3kKBF6lOP3G9eBZtHF1Avuq74/Solarized-Colors-Cursors_1.8.zip"

RDEPEND="x11-libs/libX11
        x11-libs/libXcursor"
DEPEND=""

S="${WORKDIR}/${PN}"

src_install() {
	insinto "/usr/share/cursors/xorg-x11"
	doins -r *
}
