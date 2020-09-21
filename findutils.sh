summary="Collection of GNU find, xargs, and locate"
homepage="https://www.gnu.org/software/findutils"
url="https://ftp.gnu.org/gnu/findutils/findutils-4.7.0.tar.xz"
sha256="c5fefbdf9858f7e4feb86f036e1247a54c79fc2d8e4b7064d5aaa1f47dfa789a"
license="GPL-3.0"

prepare() {
    fetch_config_sub   build-aux &&
    fetch_config_guess build-aux
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --without-selinux \
        --with-included-regex \
        --enable-threads=posix \
        --enable-largefile \
        --enable-leaf-optimisation \
        --enable-d_type-optimisation \
        --disable-nls \
        --disable-rpath \
        --disable-assert \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" &&
    sed_in_place 's/find.texi\ //' doc/Makefile &&
    make clean &&
    make install
}
