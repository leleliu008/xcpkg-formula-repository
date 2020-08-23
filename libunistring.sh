summary="C string library for manipulating Unicode strings"
homepage="https://www.gnu.org/software/libunistring"
url="https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.xz"
sha256="eb8fb2c3e4b6e2d336608377050892b54c3c983b646c561836550863003c05d7"
dependencies="libiconv"

prepare() {
    curl -L -o build-aux/config.sub   "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD" &&
    curl -L -o build-aux/config.guess "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD" &&
    sed_in_place 's/arm64-*/arm64-*|arm64e-*/g' build-aux/config.sub
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --with-libiconv-prefix="$libiconv_DIR_INSTALL_PREFIX" \
        --disable-rpath \
        --disable-shared \
        --enable-static \
        --enable-threads=posix \
        --enable-relocatable \
        --enable-namespacing \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CXX="$CXX" \
        CXXFLAGS="$CXXFLAGS" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" \
        PKG_CONFIG='' && \
    make clean &&
    make install
}
