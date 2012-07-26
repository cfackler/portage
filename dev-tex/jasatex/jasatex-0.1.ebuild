# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit latex-package

MY_P="JasaTeX"
S="${WORKDIR}/texmf-${MY_P}"

DESCRIPTION="LaTeX package for preparing manuscripts for the Journal of the Acoustical Society of America."
HOMEPAGE="http://asadl.org/jasa/"
SRC_URI="ftp://ftp.aip.org/asa/${MY_P}-0.1tc7.zip"

LICENSE="LPPL-1.3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=">=dev-tex/natbib-7"

src_install() {
	cd "${S}/tex/latex/${MY_P}"
	latex-package_src_install

	cd "${S}/bibtex/bst/${MY_P}"
	latex-package_src_install

	cd "${S}/src/${MY_P}"
	latex-package_src_install
}
