package set summary "a POSIX-compliant implementation of /bin/sh that aims to be as small as possible"
package set webpage "http://gondor.apana.org.au/~herbert/dash"
package set git.url "https://git.kernel.org/pub/scm/utils/dash/dash.git"
package set src.url "http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.5.tar.gz"
package set src.sum "db778110891f7937985f29bf23410fe1c5d669502760f584e54e0e7b29e123bd"
package set license "BSD-3-Clause"
package set bsystem "configure"
package set dep.pkg "libedit"

prepare() {
    sed_in_place '/LDFLAGS=/c :' configure
}

# vi /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/include/sys/stat.h +426
# int stat64(const char *, struct stat64 *) __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_5, __MAC_10_6, __IPHONE_NA, __IPHONE_NA);

build() {
    configure \
        --with-libedit="$libedit_INSTALL_DIR" \
        --enable-glob \
        --enable-test-workaround \
        --enable-fnmatch \
        --enable-lineno \
        ac_cv_func_stpcpy=yes \
        ac_cv_func_strtod=yes \
        ac_cv_func_killpg=yes \
        ac_cv_func_sysconf=yes \
        ac_cv_func_stat64=no
}
