package set summary "XML-based font configuration tools"
package set webpage "https://wiki.freedesktop.org/www/Software/fontconfig"
package set git.url "https://gitlab.freedesktop.org/fontconfig/fontconfig.git"
package set src.url "https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.13.1.tar.bz2"
package set src.sum "f655dd2a986d7aa97e052261b36aa67b0a64989496361eca8d604e6414006741"
package set license "MIT"
package set bsystem "configure"
package set dep.cmd "pkg-config gperf"
package set dep.pkg "gettext libiconv util-linux json-c expat freetype2-with-harfbuzz"
package set ldflags "-lbz2 -lz -lm -lbrotlidec -lbrotlicommon -lpng -lharfbuzz -lglib-2.0 -liconv -lintl"

prepare() {
    sed_in_place 's|po-conf test|po-conf|' Makefile.in
}

build() {
    configure \
        --enable-iconv \
        --enable-docs \
        --with-libiconv-prefix="$libiconv_INSTALL_DIR" \
        --with-libintl-prefix="$gettext_INSTALL_DIR" \
        --with-expat="$expat_INSTALL_DIR"
}
