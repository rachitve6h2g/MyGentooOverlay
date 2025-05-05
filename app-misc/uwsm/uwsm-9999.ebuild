# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 meson

DESCRIPTION="Universal Wayland Session Manager"
HOMEPAGE="https://github.com/Vladimir-csp/uwsm"
EGIT_REPO_URI="https://github.com/Vladimir-csp/uwsm.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+uuctl +fumon +uwsm-app"

DEPEND="dev-python/pyxdg
	dev-python/dbus-python
	sys-apps/dbus-broker
	dev-libs/newt"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure(){	local emesonargs=(
		$(meson_feature uuctl uuctl)
		$(meson_feature fumon fumon)
		$(meson_feature uwsm-app uwsm-app)
	)
	meson_src_configure
}
