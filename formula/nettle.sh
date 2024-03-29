package set summary "Low-level cryptographic library"
package set webpage "https://www.lysator.liu.se/~nisse/nettle"
package set src.url "https://ftp.gnu.org/gnu/nettle/nettle-3.7.3.tar.gz"
package set src.sum "661f5eb03f048a3b924c3a8ad2515d4068e40f67e774e8a26827658007e3bcf0"
package set license "GPL-2.0-or-later"
package set bsystem "configure"
package set dep.pkg "gmp"

prepare() {
    sed_in_place '/cat >conftest.c <<EOF/a #include<stdlib.h>' configure &&
    sed_in_place 's/-soname=/-install_name,/g' configure
}

build() {
    configure \
        --with-include-path="$gmp_INCLUDE_DIR" \
        --with-lib-path="$gmp_LIBRARY_DIR" \
        --disable-fat \
        --disable-gcov \
        --disable-openssl \
        --disable-mini-gmp \
        --disable-assembler \
        --enable-documentation
}
