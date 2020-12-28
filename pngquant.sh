summary "PNG image optimizing utility"
webpage "https://pngquant.org"
version "2.12.5"
src_url "https://pngquant.org/pngquant-$(version)-src.tar.gz"
src_sum "3638936cf6270eeeaabcee42e10768d78e4dc07cac9310307835c1f58b140808"
depends "libpng"

prepare() {
    sed_in_place 's/! find_library/find_library/' configure &&
    sed_in_place 's/find_pkgconfig libpng/true/g' configure &&
    sed_in_place 's/-mmacosx-version-min=10.7//g' configure &&
    sed_in_place 's/-mmacosx-version-min=10.7//g' lib/configure
}

build() {
    export OSTYPE=darwin
    cd "$SOURCE_DIR" &&
    ./configure \
        --prefix="$ABI_INSTALL_DIR" \
        --disable-sse \
        --with-libpng="$libpng_INSTALL_DIR" \
        --without-lcms2 \
        CC="$CC" \
        CFLAGS="$CFLAGS $CPPFLAGS" \
        LDFLAGS="$LDFLAGS -lpng" &&
    $MAKE clean &&
    $MAKE install
}
