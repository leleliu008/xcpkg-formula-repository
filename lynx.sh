summary "Text-based web browser"
webpage "http://lynx.browser.org"
version "2.8.9rel.1"
src_url "https://invisible-mirror.net/archives/lynx/tarballs/lynx$(version).tar.bz2"
src_sum "387f193d7792f9cfada14c60b0e5c0bff18f227d9257a39483e14fa1aaf79595"
license "GPL-2.0"
bsystem "configure"
depends "ncurses bzip2 openssl"
ldflags "-lncurses"

prepare() {
    sed_in_place 's/XOPEN_SOURCE=500/XOPEN_SOURCE=600/g'        configure &&
    sed_in_place 's/test "x$cf_have_ncuconfig" = "xno"/false/g' configure &&
    sed_in_place 's/#define socklen_t int/#define XXXXXXX/' WWW/Library/Implementation/www_tcp.h &&
    sed_in_place 's/vasprintf(&temp/vsprintf(temp/'         WWW/Library/Implementation/HTString.c &&
    inject_stub_system src/LYUtils.c &&
    sed_in_place "1i char* mkdtemp(char*);" src/LYUtils.c
}

build() {
    configure \
        --enable-echo \
        --enable-warnings \
        --enable-ipv6 \
        --enable-ftp \
        --disable-trace \
        --with-screen=ncurses \
        --with-curses-dir="$ncurses_INSTALL_DIR" \
        --with-zlib \
        --with-bzlib \
        --with-ssl \
        --without-x \
        --without-gnutls \
        --without-socks \
        --without-socks5 \
        cf_cv_ncurses_header=ncurses.h \
        ac_cv_func__nc_freeall=yes \
        ac_cv_func__nc_free_and_exit=yes
}
