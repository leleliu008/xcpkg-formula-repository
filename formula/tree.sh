package set summary "Display directories as trees (with optional color/HTML output)"
package set webpage "http://mama.indstate.edu/users/ice/tree"
package set src.url "http://mama.indstate.edu/users/ice/tree/src/tree-2.0.0.tgz"
package set src.sum "782cd73179f65cfca7f29326f1511306e49e9b11d5b861daa57e13fd7262889f"
package set license "GPL-2.0-or-later"
package set bsystem "make"

prepare2() {
    inject_stub_system html.c &&
    sed_in_place '/OBJS=/a OBJS+=strverscmp.o' Makefile
}

build() {
    makew -C "$SOURCE_DIR" clean &&
    makew -C "$SOURCE_DIR" install \
        prefix="$TARGET_INSTALL_DIR" \
        CC="$CC" \
        CFLAGS="'$CFLAGS $CPPFLAGS -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64'" \
        LDFLAGS="'$LDFLAGS'"
}
