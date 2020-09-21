summary="GNU internationalization (i18n) and localization (l10n) library"
homepage="https://www.gnu.org/software/gettext"
url="https://ftp.gnu.org/gnu/gettext/gettext-0.21.tar.xz"
sha256="d20fcbb537e02dcf1383197ba05bd0734ef7bf5db06bdb241eb69b7d16b73192"
license="GPL-3.0"

prepare() {
    sed_in_place 's/defined __APPLE__ && defined __MACH__/0/g' libtextstyle/lib/get_ppid_of.c &&
    sed_in_place 's/defined __APPLE__ && defined __MACH__/0/g' libtextstyle/lib/get_progname_of.c &&
    fetch_config_sub   build-aux &&
    fetch_config_guess build-aux &&
    cp build-aux/config.sub   libtextstyle/build-aux/ &&
    cp build-aux/config.guess libtextstyle/build-aux/ &&
    cp build-aux/config.sub   gettext-tools/examples/hello-c++-kde/admin/ &&
    cp build-aux/config.guess gettext-tools/examples/hello-c++-kde/admin/
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-included-regex \
        --with-included-gettext \
        --with-included-libxml \
        --with-included-libunistring \
        --disable-acl \
        --disable-rpath \
        --disable-openmp \
        --disable-curses \
        --disable-csharp \
        --disable-java \
        --enable-c++ \
        --enable-static \
        --enable-shared \
        --enable-largefile \
        --enable-threads=posix \
        --enable-libasprintf \
        --enable-namespacing \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CXX="$CXX" \
        CXXFLAGS="$CXXFLAGS" \
        CPP="$CPP" \
        CPPFLAGS="$CPPFLAGS -DOMIT_SETLOCALE_LOCK=0" \
        LDFLAGS="$LDFLAGS -L$DIR_SRC/gettext-tools/gnulib-lib/.libs/" \
        AR="$AR" \
        RANLIB="$RANLIB" &&
    make clean &&
    make install
}
