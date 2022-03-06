package set summary "HTTP/2 C Library"
package set webpage "https://nghttp2.org"
package set git.url "https://github.com/nghttp2/nghttp2.git"
package set src.url "https://github.com/nghttp2/nghttp2/releases/download/v1.47.0/nghttp2-1.47.0.tar.gz"
package set src.sum "62f50f0e9fc479e48b34e1526df8dd2e94136de4c426b7680048181606832b7c"
package set license "MIT"
package set bsystem "configure"
package set dep.pkg "libevent libev openssl jansson libxml2 c-ares cunit"

# ld: targeted OS version does not support use of thread local variables in __ZN5shrpx10log_configEv for architecture x86_64
# https://stackoverflow.com/questions/52282646/build-error-targeted-os-version-does-not-support-use-of-thread-local-variables

build() {
    configure \
        --enable-threads \
        --enable-app \
        --enable-examples \
        --enable-hpack-tools \
        --disable-asio-lib \
        --disable-python-bindings \
        --disable-lib-only \
        --disable-werror \
        --disable-assert \
        --without-systemd \
        --without-jemalloc \
        --with-libxml2 \
        ZLIB_CFLAGS='-lz' \
        ZLIB_LIBS='-lz'
}
