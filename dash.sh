summary  "POSIX-compliant descendant of NetBSD's ash (the Almquist SHell)"
homepage "http://gondor.apana.org.au/~herbert/dash"
url      "http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.2.tar.gz"
sha256   "00fb7d68b7599cc41ab151051c06c01e9500540183d8aa72116cb9c742bd6d5f"
license  "BSD-3-Clause"
dependencies "libedit"

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
