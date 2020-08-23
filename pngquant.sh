summary="PNG image optimizing utility"
homepage="https://pngquant.org"
url="https://pngquant.org/pngquant-2.12.5-src.tar.gz"
sha256="3638936cf6270eeeaabcee42e10768d78e4dc07cac9310307835c1f58b140808"
version="2.12.5"
dependencies="libpng"

prepare() {
    sed_in_place 's/find_pkgconfig libpng/true/g' configure &&
    sed_in_place 's/-mmacosx-version-min=10.7//g' configure &&
    sed_in_place 's/-mmacosx-version-min=10.7//g' lib/configure
}

build() {
    unset TARGET_ARCH
    ./configure \
        --prefix="$DIR_INSTALL_PREFIX" \
        --disable-sse \
        --with-libpng="$libpng_DIR_INSTALL_PREFIX" \
        --without-lcms2 \
        CC="$CC" \
        CFLAGS="$CFLAGS $CPPFLAGS" \
        LDFLAGS="$LDFLAGS -lpng" &&
    make clean &&
    make install
}
