summary="Library to create an ISO-9660 filesystem with extensions like RockRidge or Joliet"
homepage="https://www.libburnia-project.org"
url="http://files.libburnia-project.org/releases/libisofs-1.5.2.tar.gz"
sha256="ef5a139600b3e688357450e52381e40ec26a447d35eb8d21524598c7b1675500"

prepare() {
    fetch_config_sub &&
    fetch_config_guess
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --enable-largefile \
        --enable-static \
        --enable-shared \
        --enable-xattr \
        --enable-zlib \
        --disable-libacl \
        --disable-debug \
        --disable-verbose-debug \
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
