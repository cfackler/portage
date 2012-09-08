# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit elisp git-2

DESCRIPTION="Yet Another Message Interface on Emacsen"
HOMEPAGE="https://github.com/wanderlust/wanderlust http://www.gohome.org/wl/"
EGIT_REPO_URI="git://github.com/wanderlust/wanderlust.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE="bbdb ssl"

DEPEND=">=app-emacs/apel-10.6
	virtual/emacs-flim
	app-emacs/semi
	bbdb? ( app-emacs/bbdb )"
RDEPEND="!app-emacs/wanderlust-cvs
	${DEPEND}"

S="${WORKDIR}/${PN}"
SITEFILE="50${PN}-gentoo.el"

src_configure() {
	local lang="\"en\""
	echo "(setq wl-info-lang '(${lang}) wl-news-lang '(${lang}))" >>WL-CFG
	use ssl && echo "(setq wl-install-utils t)" >>WL-CFG
}

src_compile() {
	emake || die "emake failed"
	emake info || die "emake info failed"
}

src_install() {
	emake \
		LISPDIR="${ED}${SITELISP}" \
		PIXMAPDIR="${ED}${SITEETC}/wl/icons" \
		install || die "emake install failed"

	elisp-site-file-install "${FILESDIR}/${SITEFILE}" wl || die

	insinto "${SITEETC}/wl/samples/en"
	doins samples/en/* || die
	doinfo doc/wl*.info || die
	dodoc BUGS ChangeLog INSTALL NEWS README
}
