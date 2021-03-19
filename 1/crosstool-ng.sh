summary "Tool for building toolchains"
webpage "https://crosstool-ng.github.io"
src_url "http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.24.0.tar.xz"
src_sum "804ced838ea7fe3fac1e82f0061269de940c82b05d0de672e7d424af98f22d2d"
license "LGPL-2.1"
bsystem "configure"
require "libtoolize libtool help2man objcopy"
depends "ncurses"

build() {
    configure \
        --with-bash-completion \
        --with-ncurses \
        CURSES_LIBS="$ncurses_LIBRARY_DIR/libncurses.a" \
        PANEL_LIBS="$ncurses_LIBRARY_DIR/libpanel.a" \
        MENU_LIBS="$ncurses_LIBRARY_DIR/libmenu.a" \
        ac_cv_func_malloc_0_nonnull=yes \
        ac_cv_func_realloc_0_nonnull=yes
}
