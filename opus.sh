summary="Audio codec"
homepage="https://www.opus-codec.org"
url="https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz"
sha256="65b58e1e25b2a114157014736a3d9dfeaad8d41be1c8179866f144a2fb44ff9d"

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --disable-assertions \
        --disable-extra-programs \
        --disable-doc \
        --disable-shared \
        --enable-static \
        --enable-asm \
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
