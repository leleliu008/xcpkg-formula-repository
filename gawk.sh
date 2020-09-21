summary="GNU awk utility"
homepage="https://www.gnu.org/software/gawk"
url="https://ftp.gnu.org/gnu/gawk/gawk-5.1.0.tar.xz"
sha256="cf5fea4ac5665fd5171af4716baab2effc76306a9572988d5ba1078f196382bd"
license="GPL-3.0"
dependencies="mpfr"

prepare() {
    gen_c_file_stub_system &&
    sed_in_place 's/system(cmd)/stub_system(cmd)/g' builtin.c &&
    sed_in_place "1i #include<$C_FILE_STUB_SYSTEM>" builtin.c &&
    fetch_config_sub &&
    fetch_config_guess &&
    cp config.sub   extension/build-aux/ &&
    cp config.guess extension/build-aux/
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-mpfr="$mpfr_DIR_INSTALL_PREFIX" \
        --enable-extensions \
        --enable-lint \
        --enable-mpfr \
        --enable-largefile \
        --disable-nls \
        --disable-rpath \
        --disable-builtin-intdiv0 \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" &&
    make clean &&
    make install
}
