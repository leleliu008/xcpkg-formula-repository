summary="GNOME XML library"
homepage="http://xmlsoft.org"
url="ftp://xmlsoft.org/libxml2/libxml2-2.9.10.tar.gz"
sha256="aafee193ffb8fe0c82d4afef6ef91972cbaf5feea100edc2f262750611b4be1f"
dependencies="libiconv"

prepare() {
    curl -L -o config.sub   "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD" &&
    curl -L -o config.guess "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD" &&
    sed_in_place 's/arm64-*/arm64-*|arm64e-*/g' config.sub
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --with-zlib \
        --with-iconv="$libiconv_DIR_INSTALL_PREFIX" \
        --without-lzma \
        --without-python \
        --without-readline \
        --disable-debug \
        --disable-shared \
        --enable-static \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" \
        PKG_CONFIG='' && \
    make clean &&
    make install
}
