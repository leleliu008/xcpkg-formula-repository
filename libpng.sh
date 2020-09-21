summary="Library for manipulating PNG images"
homepage="http://www.libpng.org/pub/png/libpng.html"
url="https://downloads.sourceforge.net/libpng/libpng-1.6.37.tar.xz"
sha256="505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca"

build() {
    cmake \
    -DPNG_SHARED=OFF \
    -DPNG_STATIC=ON \
    -DPNG_TESTS=OFF \
    -DPNG_DEBUG=OFF \
    -DPNG_BUILD_ZLIB=ON \
    -DPNG_ARM_NEON=off
}

build2() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --with-zlib-prefix="$zlib_DIR_INSTALL_PREFIX" \
        --enable-static=yes \
        --enable-shared=no \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPP="$CPP" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" &&
    make clean &&
    make install
}
