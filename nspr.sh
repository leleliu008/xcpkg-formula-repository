summary "Platform-neutral API for system-level and libc-like functions"
webpage "https://developer.mozilla.org/docs/Mozilla/Projects/NSPR"
src_url "https://archive.mozilla.org/pub/nspr/releases/v4.29/src/nspr-4.29.tar.gz"
src_sum "22286bdb8059d74632cc7c2865c139e63953ecfb33bf4362ab58827e86e92582"
license "MPL-2.0"

prepare() {
    SOURCE_DIR="$WORKING_DIR/nspr"
}

build() {
    export CC="$CC -arch $BUILD_FOR_ARCH"
    BUILD_FOR_HOST=$(echo $BUILD_FOR_HOST | sed 's/-ios/-darwin/')
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
