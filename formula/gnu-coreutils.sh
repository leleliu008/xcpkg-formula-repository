package set summary "GNU File, Shell, and Text utilities"
package set webpage "https://www.gnu.org/software/coreutils"
package set src.url "https://ftp.gnu.org/gnu/coreutils/coreutils-9.0.tar.xz"
package set src.sum "ce30acdf4a41bc5bb30dd955e9eaa75fa216b4e3deb08889ed32433c7b3b97ce"
package set license "GPL-3.0"
package set bsystem "configure"

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
