# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils perl-module

MY_PN="biblatex-${PN}"

DESCRIPTION="A BibTeX replacement for users of biblatex"
HOMEPAGE="http://biblatex-biber.sourceforge.net/"
SRC_URI="mirror://sourceforge/project/${MY_PN}/${MY_PN}/${PV}/${MY_PN}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( Artistic-2 GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND="${RDEPEND}
	test? ( dev-perl/File-Which
			dev-perl/Mozilla-CA )
	virtual/perl-Module-Build"
RDEPEND=">=dev-lang/perl-5.14
	dev-perl/Business-ISBN
	dev-perl/Business-ISSN
	dev-perl/Business-ISMN
	dev-perl/Data-Compare
	dev-perl/Data-Diver
	dev-perl/Data-Dump
	dev-perl/Date-Simple
	dev-perl/File-Slurp-Unicode
	dev-perl/IPC-Run3
	dev-perl/libwww-perl
	dev-perl/List-AllUtils
	dev-perl/Log-Log4perl
	dev-perl/regexp-common
	dev-perl/Readonly
	dev-perl/Readonly-XS
	>=dev-perl/Text-BibTeX-0.66
	dev-perl/XML-LibXML-Simple
	dev-perl/XML-LibXSLT
	=dev-tex/biblatex-2.5
	virtual/perl-IPC-Cmd
	dev-perl/LWP-Protocol-https
	dev-perl/URI"

S="${WORKDIR}/${MY_PN}-${PV}"

SRC_TEST="parallel"
