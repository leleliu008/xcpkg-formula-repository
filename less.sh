summary="Pager program similar to more"
homepage="http://www.greenwoodsoftware.com/less/index.html"
url="http://www.greenwoodsoftware.com/less/less-551.tar.gz"
sha256="ff165275859381a63f19135a8f1f6c5a194d53ec3187f94121ecd8ef0795fe3d"
license="GPL-3.0-or-later"
dependencies="ncurses pcre2"

prepare() {
    gen_c_file_stub_system &&
    sed_in_place "1i #include<$C_FILE_STUB_SYSTEM>" lsystem.c &&
    sed_in_place 's/system(cmd)/stub_system(cmd)/g' lsystem.c &&
    sed_in_place 's/system(p)/stub_system(p)/g'     lsystem.c &&
    sed_in_place 's/TERMLIBS=/TERMLIBS="-lncurses"/' configure
}

build() {
    configure \
        --with-regex='pcre2' \
        --with-secure \
        ac_cv_lib_tinfo_tgoto=no \
        ac_cv_lib_xcurses_initscr=no \
        ac_cv_lib_ncursesw_initscr=no \
        ac_cv_lib_ncurses_initscr=yes \
        ac_cv_lib_curses_initscr=no \
        ac_cv_lib_termcap_tgetent=no \
        ac_cv_lib_termlib_tgetent=no
}
