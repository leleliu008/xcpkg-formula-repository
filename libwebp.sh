summary="Image format providing lossless and lossy compression for web images"
homepage="https://developers.google.com/speed/webp"
url="http://downloads.webmproject.org/releases/webp/libwebp-1.1.0.tar.gz"
sha256="98a052268cc4d5ece27f76572a7f50293f439c17a98e67c4ea0c7ed6f50ef043"
dependencies="libpng libtiff libjpeg-turbo giflib"

build2() {
    cmake \
    -DCMAKE_TOOLCHAIN_FILE="$CMAKE_TOOLCHAIN_FILE" \
    -DCMAKE_INSTALL_PREFIX="$DIR_INSTALL_PREFIX" \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_PIC=ON \
    -DENABLE_CLI=OFF \
    -DENABLE_SHARED=OFF \
    -DENABLE_ASSEMBLY=OFF \
    -G "Unix Makefiles" \
    -Wno-dev \
    -S "$DIR_SRC" \
    -B "$DIR_BUILD" &&
    make --directory="$DIR_BUILD" -j$(nproc) install
}

build() {
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
