# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
aho-corasick-1.1.1
atty-0.2.14
autocfg-1.1.0
bitflags-1.3.2
bitflags-2.4.0
cc-1.0.83
cfg-if-1.0.0
clap-3.2.25
clap_lex-0.2.4
dlib-0.5.2
downcast-rs-1.2.0
glob-0.3.1
hashbrown-0.12.3
hermit-abi-0.1.19
indexmap-1.9.3
itoa-1.0.9
libc-0.2.148
libloading-0.8.1
log-0.4.20
memchr-2.6.4
memoffset-0.7.1
nix-0.26.4
os_str_bytes-6.5.1
pkg-config-0.3.27
proc-macro2-1.0.67
quick-xml-0.30.0
quote-1.0.33
regex-1.9.6
regex-automata-0.3.9
regex-syntax-0.7.5
ryu-1.0.15
scoped-tls-1.0.1
serde-1.0.188
serde_derive-1.0.188
serde_json-1.0.107
smallvec-1.11.1
strsim-0.10.0
syn-2.0.37
termcolor-1.3.0
textwrap-0.16.0
unicode-ident-1.0.12
wayland-backend-0.3.2
wayland-client-0.31.1
wayland-protocols-0.31.0
wayland-protocols-wlr-0.2.0
wayland-scanner-0.31.0
wayland-sys-0.31.1
winapi-0.3.9
winapi-util-0.1.6
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.6
winapi-x86_64-pc-windows-gnu-0.4.0
windows-sys-0.48.0
windows-targets-0.48.5
windows_aarch64_gnullvm-0.48.5
windows_aarch64_msvc-0.48.5
windows_i686_gnu-0.48.5
windows_i686_msvc-0.48.5
windows_x86_64_gnu-0.48.5
windows_x86_64_gnullvm-0.48.5
windows_x86_64_msvc-0.48.5
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
