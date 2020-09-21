summary="Image format providing lossless and lossy compression for web images"
homepage="https://developers.google.com/speed/webp"
url="http://downloads.webmproject.org/releases/webp/libwebp-1.1.0.tar.gz"
sha256="98a052268cc4d5ece27f76572a7f50293f439c17a98e67c4ea0c7ed6f50ef043"
dependencies="libpng libtiff libjpeg-turbo giflib"

build() {
    cmake \
    -DPNG_PNG_INCLUDE_DIR="$libpng_DIR_INCLUDE" \
    -DPNG_LIBRARY="$libpng_DIR_LIB/libpng.a" \
    -DJPEG_INCLUDE_DIR="$libjpeg_turbo_DIR_INCLUDE" \
    -DJPEG_LIBRARY="$libjpeg_turbo_DIR_LIB/libjpeg.a"\
    -DTIFF_INCLUDE_DIR="$libtiff_DIR_INCLUDE" \
    -DTIFF_LIBRARY="$libtiff_DIR_LIB/libtiff.a" \
    -DGIF_INCLUDE_DIR="$giflib_DIR_INCLUDE" \
    -DGIF_LIBRARY="$giflib_DIR_LIB/libgif.a"
}

build2() {
    $DIR_SRC/configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --disable-shared \
        --enable-static \
        --enable-libwebpdecoder \
        --enable-swap-16bit-csp \
        --enable-libwebpmux \
        --with-pngincludedir="$libpng_DIR_INCLUDE" \
        --with-pnglibdir="$libpng_DIR_LIB" \
        --with-jpegincludedir="$libjpeg_turbo_DIR_INCLUDE" \
        --with-jpeglibdir="$libjpeg_turbo_DIR_LIB" \
        --with-tiffincludedir="$libtiff_DIR_INCLUDE" \
        --with-tifflibdir="$libtiff_DIR_LIB" \
        --with-gifincludedir="$giflib_DIR_INCLUDE" \
        --with-giflibdir="$giflib_DIR_LIB" \
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
