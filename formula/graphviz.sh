package set summary "Graph visualization software from AT&T and Bell Labs"
package set webpage "https://www.graphviz.org"
package set git.url "https://gitlab.com/graphviz/graphviz.git"
package set src.url "https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/2.50.0/graphviz-2.50.0.tar.xz"
package set src.sum "6b16bf990df114195be669773a1dae975dbbffada45e1de2849ddeb5851bb9a8"
package set license "EPL-1.0"
package set dep.cmd "pkg-config libtoolize libtool groff ps2pdf"
package set dep.pkg "fontconfig libpng expat"
package set bsystem "autotools"

prepare() {
    sed_in_place 's|install-exec-hook|xxxxxxxxxxxx|' cmd/dot/Makefile.am &&
    autoreconf -ivf &&
    inject_stub_system lib/sparse/general.c lib/common/utils.c lib/gvpr/compile.c contrib/diffimg/diffimg.c
}

build() {
    export HOSTCC="$CC_FOR_BUILD"
    configure --enable-swig=no
}
