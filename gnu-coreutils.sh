summary "GNU File, Shell, and Text utilities"
webpage "https://www.gnu.org/software/coreutils"
src_url "https://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz"
src_sum "4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa"
license "GPL-3.0"

# __OSX_AVAILABLE(10.12) __IOS_PROHIBITED
# __TVOS_PROHIBITED __WATCHOS_PROHIBITED
# int clock_settime(clockid_t __clock_id, const struct timespec *__tp);

build() {
    configure \
        --with-included-regex \
        --without-linux-crypto \
        --without-gmp \
        --without-openssl \
        --without-selinux \
        --disable-acl \
        --disable-libcap \
        --disable-libsmack \
        --disable-assert \
        --disable-gcc-warnings \
        --enable-xattr \
        --enable-threads=posix \
        ac_cv_func_clock_settime=no
}
