summary "Bourne-Again SHell, a UNIX command interpreter"
webpage "https://www.gnu.org/software/bash"
src_git "https://git.savannah.gnu.org/git/bash.git"
src_url "https://mirrors.tuna.tsinghua.edu.cn/gnu/bash/bash-5.0.tar.gz"
src_sum "b4a80f2ac66170b2913efbfb9f2594f1f76c7b1afd11f799e22035d63077fb4d"
version "5.0.18"
license "GPL-3.0-or-later"
bsystem "configure"
depends "ncurses"

prepare() {
    #sed_in_place 's|#undef HAVE_STRSIGNAL|#define HAVE_STRSIGNAL 1|' config.h.in &&
    sed_in_place 's|#undef HAVE_POSIX_SIGNALS|#define HAVE_POSIX_SIGNALS 1|' config.h.in
}

build() {
    configure \
        --with-curses \
        --without-bash-malloc \
        --disable-profiling \
        --enable-readline \
        --enable-select \
        --enable-history \
        --enable-static-link \
        --enable-strict-posix-default \
        ac_cv_func_gethostname=yes \
        ac_cv_func_dprintf=yes \
        ac_cv_func_vprintf=yes \
        ac_cv_func_snprintf=yes \
        ac_cv_func_strpbrk=yes \
        ac_cv_func_mkfifo=yes \
        ac_cv_func_strchr=yes \
        ac_cv_func_bcopy=yes \
        ac_cv_func_bzero=yes \
        ac_cv_func_times=yes \
        ac_cv_func_ulimit=yes \
        ac_cv_func_tcgetattr=yes \
        ac_cv_func_siginterrupt=yes \
        bash_cv_have_strsignal=yes \
        bash_cv_func_snprintf=yes \
        bash_cv_func_vsnprintf=yes
}
