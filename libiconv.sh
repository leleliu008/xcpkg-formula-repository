summary="charset conversion library"
homepage="https://www.gnu.org/software/libiconv"
url="https://ftp.gnu.org/gnu/libiconv/libiconv-1.16.tar.gz"
sha256="e6a1b1b589654277ee790cce3734f07876ac4ccfaecbee8afa0b649cf529cc04"
#dependencies="gettext"

prepare() {
    curl -L -o build-aux/config.sub   "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD" &&
    curl -L -o build-aux/config.guess "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD" &&
    sed_in_place 's/arm64-*/arm64-*|arm64e-*/g' build-aux/config.sub &&
    cp build-aux/config.sub   libcharset/build-aux/config.sub &&
    cp build-aux/config.guess libcharset/build-aux/config.guess
}

build() {
    ./configure \
       --host="$TARGET_HOST" \
       --prefix="$DIR_INSTALL_PREFIX" \
       --with-sysroot="$SYSROOT" \
       --disable-nls \
       --disable-debug \
       --disable-shared \
       --enable-static \
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
