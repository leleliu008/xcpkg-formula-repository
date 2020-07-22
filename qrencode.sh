summary="QR Code generation"
homepage="https://fukuchi.org/works/qrencode"
url="https://fukuchi.org/works/qrencode/qrencode-4.0.2.tar.gz"
sha256="dbabe79c07614625d1f74d8c0ae2ee5358c4e27eab8fd8fe31f9365f821a3b1d"
dependencies="libpng"

build() {
    cmake \
    -DCMAKE_TOOLCHAIN_FILE="$CMAKE_TOOLCHAIN_FILE" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$DIR_INSTALL_PREFIX" \
    -DBUILD_SHARED_LIBS=OFF \
    -DWITH_TESTS=OFF \
    -DWITH_TOOLS=OFF \
    -DWITHOUT_PNG=OFF \
    -DPNG_PNG_INCLUDE_DIR="$libpng_DIR_INCLUDE" \
    -DPNG_LIBRARY_RELEASE="$libpng_DIR_LIB/libpng.a" \
    -DZLIB_INCLUDE_DIR="$zlib_DIR_INCLUDE" \
    -DZLIB_LIBRARY_RELEASE="$zlib_DIR_LIB/libz.a" \
    -G "Unix Makefiles" \
    -Wno-dev \
    -S "$DIR_SRC" \
    -B "$DIR_BUILD" &&
    make --directory="$DIR_BUILD" -j$(nproc) install 
}

build2() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --without-tools \
        --enable-static=yes \
        --enable-shared=no \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" && \
    make clean && \
    make install
}

create_framework() {
    mkdir -p "$DIR_INSTALL_PACKAGE/qrencode.framework/Headers"
    cp "$DIR_INSTALL_PACKAGE/iPhoneOS/armv7s/include/qrencode.h" "$DIR_INSTALL_PACKAGE/qrencode.framework/Headers"
    lipo -create -output "$DIR_INSTALL_PACKAGE/qrencode.framework/libqrencode.a" $(find "$DIR_INSTALL_PACKAGE" -name "*.a")
}
