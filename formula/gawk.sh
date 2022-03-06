package set summary "GNU awk utility"
package set webpage "https://www.gnu.org/software/gawk"
package set src.url "https://ftp.gnu.org/gnu/gawk/gawk-5.1.1.tar.xz"
package set src.sum "d87629386e894bbea11a5e00515fc909dc9b7249529dad9e6a3a2c77085f7ea2"
package set license "GPL-3.0"
package set dep.pkg "mpfr"
package set bsystem "configure"

prepare() {
    inject_stub_system builtin.c
}

build() {
    configure \
        --with-mpfr="$mpfr_INSTALL_DIR" \
        --enable-extensions \
        --enable-lint \
        --enable-mpfr \
        --disable-builtin-intdiv0
}
