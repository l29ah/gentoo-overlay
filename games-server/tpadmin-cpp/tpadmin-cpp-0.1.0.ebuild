# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games

DESCRIPTION="A command-line administration utility for Thousand Parsec servers."
HOMEPAGE="http://www.thousandparsec.net/tp/"
SRC_URI="mirror://sourceforge/thousandparsec/${P}.tar.gz
         http://www.thousandparsec.net/tp/downloads/${PN}/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64 sparc"
IUSE=""

DEPEND=">=dev-libs/libtprl-0.1.2
        >=dev-games/libtpproto-cpp-0.1.9
		dev-libs/boost"
RDEPEND="${DEPEND}"

src_compile() {
	egamesconf || die "egamesconf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README

	prepgamesdirs
}
