package set summary "GNU internationalization (i18n) and localization (l10n) library"
package set webpage "https://www.gnu.org/software/gettext"
package set src.url "https://ftp.gnu.org/gnu/gettext/gettext-0.21.tar.xz"
package set src.sum "d20fcbb537e02dcf1383197ba05bd0734ef7bf5db06bdb241eb69b7d16b73192"
package set license "GPL-3.0"
package set bsystem "configure"

prepare() {
    sed_in_place 's/defined __APPLE__ && defined __MACH__/0/g' libtextstyle/lib/get_ppid_of.c &&
    sed_in_place 's/defined __APPLE__ && defined __MACH__/0/g' libtextstyle/lib/get_progname_of.c
}

build() {
    export CPPFLAGS="$CPPFLAGS -DOMIT_SETLOCALE_LOCK=0"
    export LDFLAGS="$LDFLAGS -L$TARGET_BUILD_DIR/gettext-tools/gnulib-lib/.libs/"
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
        --enable-namespacing \
        --enable-nls
}
