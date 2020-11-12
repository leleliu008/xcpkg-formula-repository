summary="Display directories as trees (with optional color/HTML output)"
homepage="http://mama.indstate.edu/users/ice/tree"
version="1.8.0"
url="https://deb.debian.org/debian/pool/main/t/tree/tree_$version.orig.tar.gz"
sha256="715d5d4b434321ce74706d0dd067505bb60c5ea83b5f0b3655dae40aa6f9b7c2"
license="GPL-2.0"

prepare() {
    gen_c_file_stub_system &&
    sed_in_place 's/system(/stub_system(/g'         html.c &&
    sed_in_place "1i #include<$C_FILE_STUB_SYSTEM>" html.c &&
    sed_in_place '/OBJS=/a OBJS+=strverscmp.o' Makefile
}

build() {
    $MAKE -C "$SOURCE_DIR" clean &&
    $MAKE -C "$SOURCE_DIR" install \
        prefix="$ABI_INSTALL_DIR" \
        CC="$CC" \
        CFLAGS="$CFLAGS $CPPFLAGS -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" \
        LDFLAGS="$LDFLAGS"
}
