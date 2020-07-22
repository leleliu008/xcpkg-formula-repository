summary="Library for Apple Binary- and XML-Property Lists"
homepage="https://www.libimobiledevice.org"
url="https://github.com/libimobiledevice/libplist/releases/download/2.2.0/libplist-2.2.0.tar.bz2"
sha256="4a5517e5377ec421df84c586ba85bb4e1d26f11ad203d7d450a907c0156fbd9a"

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --disable-option-checking \
        --disable-debug \
        --disable-shared \
        --enable-static \
        --without-cython \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CXX="$CXX" \
        CXXFLAGS="$CXXFLAGS" \
        CPP="$CPP" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" \
        PKG_CONFIG="" &&
    make clean &&
    make install
}
