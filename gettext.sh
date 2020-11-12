summary="GNU internationalization (i18n) and localization (l10n) library"
homepage="https://www.gnu.org/software/gettext"
url="https://ftp.gnu.org/gnu/gettext/gettext-0.21.tar.xz"
sha256="d20fcbb537e02dcf1383197ba05bd0734ef7bf5db06bdb241eb69b7d16b73192"
license="GPL-3.0"

prepare() {
    sed_in_place 's/defined __APPLE__ && defined __MACH__/0/g' libtextstyle/lib/get_ppid_of.c &&
    sed_in_place 's/defined __APPLE__ && defined __MACH__/0/g' libtextstyle/lib/get_progname_of.c &&
    fetch_config_sub   libtextstyle/build-aux/ &&
    fetch_config_guess libtextstyle/build-aux/ &&
    cp libtextstyle/build-aux/config.sub   gettext-tools/examples/hello-c++-kde/admin/ &&
    cp libtextstyle/build-aux/config.guess gettext-tools/examples/hello-c++-kde/admin/
}

build() {
    export CPPFLAGS="$CPPFLAGS -DOMIT_SETLOCALE_LOCK=0"
    export LDFLAGS="$LDFLAGS -L$BUILD_DIR/gettext-tools/gnulib-lib/.libs/"
    configure \
        --with-included-regex \
        --with-included-gettext \
        --with-included-libxml \
        --with-included-libunistring \
        --disable-acl \
        --disable-openmp \
        --disable-curses \
        --disable-csharp \
        --disable-java \
        --enable-c++ \
        --enable-threads=posix \
        --enable-libasprintf \
        --enable-namespacing
}
