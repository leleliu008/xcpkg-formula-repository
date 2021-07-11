package set summary "Platform-neutral API for system-level and libc-like functions"
package set webpage "https://developer.mozilla.org/docs/Mozilla/Projects/NSPR"
package set src.url "https://archive.mozilla.org/pub/nspr/releases/v4.29/src/nspr-4.29.tar.gz"
package set src.sum "22286bdb8059d74632cc7c2865c139e63953ecfb33bf4362ab58827e86e92582"
package set license "MPL-2.0"
package set bsystem "configure"
package set sourced "nspr"

build() {
    export CC="$CC -arch $TARGET_OS_ARCH"

    configure \
        --enable-strip \
        --enable-ipv6 \
        --disable-cplus \
        --with-pthreads \
        HOST_CC='/usr/bin/cc' \
        HOST_CXX='/usr/bin/c++' \
        HOST_CFLAGS='-O0' \
        HOST_CXXFLAGS='-O0' \
        HOST_LDFLAGS=''
}
