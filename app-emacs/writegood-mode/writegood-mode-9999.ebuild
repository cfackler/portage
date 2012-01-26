# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit elisp git-2

DESCRIPTION="Emacs mode for improving English writing"
HOMEPAGE="https://github.com/bnbeckwith/writegood-mode"
EGIT_REPO_URI="git://github.com/bnbeckwith/writegood-mode.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

SITEFILE="50${PN}-gentoo.el"

pkg_postinst() {
	elisp-site-regen
}