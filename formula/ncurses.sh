package set summary "Text-based UI library"
package set webpage "https://www.gnu.org/software/ncurses"
package set src.url "https://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz"
package set src.sum "30306e0c76e0f9f1f0de987cf1c82a5c21e1ce6568b9227f7da5b71cbea86c9d"
package set license "MIT"
package set dep.cmd "sed grep"
package set bsystem "configure"

need_native_build() {
    # https://github.com/termux/termux-packages/issues/4487
    if command -v tic > /dev/null ; then
        run tic -V
        [ '6.2.20200212' != "$(list 6.2.20200212 $(tic -V | cut -d' ' -f2) | sort -V | head -n 1)" ]
    else
        warn 'tic command not found. we need build it now.'
    fi
}

build0() {
    need_native_build || return 0

    # /usr/bin/cc -DHAVE_CONFIG_H -I../ncurses -I. -I/var/folders/24/8k48jl6d249_n_qfxwsl6xvm0000gn/T/tmp.8sFnLL5q/ncurses -I../include -I/var/folders/24/8k48jl6d249_n_qfxwsl6xvm0000gn/T/tmp.8sFnLL5q/ncurses/../include -D_DARWIN_C_SOURCE -DNDEBUG -Qunused-arguments -no-cpp-precomp -c /var/folders/24/8k48jl6d249_n_qfxwsl6xvm0000gn/T/tmp.8sFnLL5q/ncurses/base/lib_getch.c -o ../objects/lib_getch.o
    # /var/folders/24/8k48jl6d249_n_qfxwsl6xvm0000gn/T/tmp.8sFnLL5q/ncurses/base/lib_getch.c:312:12: error: implicit declaration of function 'read' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
    # n = (int) read(sp->_ifd, &c2, (size_t) 1);
    #           ^
    # /var/folders/24/8k48jl6d249_n_qfxwsl6xvm0000gn/T/tmp.8sFnLL5q/ncurses/base/lib_getch.c:312:12: note: did you mean 'fread'?
    # /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include/stdio.h:158:9: note: 'fread' declared here
    # size_t   fread(void * __restrict __ptr, size_t __size, size_t __nitems, FILE * __restrict __stream);
    #          ^
    # 1 error generated.
    # gmake[1]: *** [Makefile:1004: ../objects/lib_getch.o] Error 1
    # gmake[1]: Leaving directory '/private/var/folders/24/8k48jl6d249_n_qfxwsl6xvm0000gn/T/tmp.8sFnLL5q/1612536982/native/ncurses'
    # gmake: *** [Makefile:120: all] Error 2

    configure \
        ac_cv_header_fcntl_h=yes \
        ac_cv_header_unistd_h=yes \
        ac_cv_header_sys_time_h=yes
}

prepare() {
    inject_stub_system progs/reset_cmd.c
}

build() {
    # https://invisible-island.net/ncurses/announce-6.0.html
    configure \
        --with-pkg-config-libdir="$TARGET_PKGCONF_DIR" \
        --with-ospeed='long' \
        --without-pkg-config \
        --without-ada \
        --without-debug \
        --without-tests \
        --without-valgrind \
        --without-shared \
        --enable-const \
        --enable-widec \
        --enable-termcap \
        --enable-warnings \
        --enable-pc-files \
        --enable-stripping \
        --disable-assertions \
        --disable-gnat-projects \
        --disable-echo \
        ac_cv_func_getopt=yes && 
    install_links
}

install_links() {
    cd "$TARGET_INCLUDE_DIR" || return 1
    for item in curses.h ncurses.h form.h menu.h panel.h term.h termcap.h
    do
        ln -s "ncursesw/$item" "$item" || return 1
    done

    cd "$TARGET_LIBRARY_DIR" || return 1
    for item in libncurses++ libncurses libpanel libmenu libform
    do
        for ext in a dylib
        do
            if [ -e   "${item}w.$ext" ] ; then
                ln -s "${item}w.$ext" "${item}.$ext" || return 1
            fi
        done
    done

    cd "$TARGET_PKGCONF_DIR" && ln -s ncursesw.pc ncurses.pc
}
