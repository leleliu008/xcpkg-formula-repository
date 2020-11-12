summary="Text-based UI library"
homepage="https://www.gnu.org/software/ncurses"
url="https://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz"
sha256="30306e0c76e0f9f1f0de987cf1c82a5c21e1ce6568b9227f7da5b71cbea86c9d"

prepare() {
    gen_c_file_stub_system &&
    sed_in_place "1i #include<$C_FILE_STUB_SYSTEM>" progs/reset_cmd.c &&
    sed_in_place 's/system(/stub_system(/'          progs/reset_cmd.c
}

build() {
    configure \
        --with-ospeed='long' \
        --without-pkg-config \
        --without-tests \
        --without-ada \
        --without-debug \
        --without-valgrind \
        --without-shared \
        --enable-warnings \
        --enable-pc-files \
        --with-pkg-config-libdir="$ABI_INSTALL_DIR/lib/pkgconfig" \
        --enable-stripping \
        --disable-assertions \
        --disable-gnat-projects \
        --disable-echo && 
    install_links
}

install_links() {
    cd "$ABI_INSTALL_DIR/include" || return 1
    for item in curses.h form.h ncurses.h panel.h term.h termcap.h
    do
        ln -s "ncurses/$item" "$item" || return 1
    done
}
