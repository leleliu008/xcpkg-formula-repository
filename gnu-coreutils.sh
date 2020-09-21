summary="GNU File, Shell, and Text utilities"
homepage="https://www.gnu.org/software/coreutils"
url="https://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz"
sha256="4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa"
license="GPL-3.0"

prepare() {
    fetch_config_sub   build-aux &&
    fetch_config_guess build-aux
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-included-regex \
        --without-linux-crypto \
        --without-gmp \
        --without-openssl \
        --without-selinux \
        --disable-acl \
        --disable-nls \
        --disable-libcap \
        --disable-libsmack \
        --disable-rpath \
        --disable-assert \
        --disable-gcc-warnings \
        --enable-largefile \
        --enable-xattr \
        --enable-threads=posix \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" &&
    sed_in_place 's/#define HAVE_CLOCK_SETTIME 1/#define HAVE_CLOCK_SETTIME 0/' lib/config.h &&
    make clean &&
    make install
}
