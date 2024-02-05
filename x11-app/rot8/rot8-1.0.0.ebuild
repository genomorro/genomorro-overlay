# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
aho-corasick-0.7.18
atty-0.2.13
autocfg-1.1.0
bitflags-1.3.2
clap-3.2.21
clap_lex-0.2.4
glob-0.3.0
hashbrown-0.12.3
indexmap-1.9.1
itoa-0.4.4
libc-0.2.62
memchr-2.5.0
os_str_bytes-6.3.0
proc-macro2-1.0.3
quote-1.0.2
regex-1.5.5
regex-syntax-0.6.26
ryu-1.0.0
serde-1.0.100
serde_derive-1.0.100
serde_json-1.0.40
strsim-0.10.0
syn-1.0.5
termcolor-1.1.3
textwrap-0.15.0
unicode-xid-0.2.0
winapi-0.3.8
winapi-util-0.1.5
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="Automatic display rotation using built-in accelerometer"

HOMEPAGE="https://github.com/efernau/rot8"

SRC_URI="$(cargo_crate_uris) https://github.com/efernau/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"

SLOT="0"

KEYWORDS="amd64"

IUSE=""

RDEPEND="virtual/rust"

DEPEND="${RDEPEND}"
