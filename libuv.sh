summary="Multi-platform support library with a focus on asynchronous I/O"
homepage="https://libuv.org"
version="1.40.0"
url="https://github.com/libuv/libuv/archive/v$version.tar.gz"
sha256="70fe1c9ba4f2c509e8166c0ca2351000237da573bb6c82092339207a9715ba6b"

prepare() {
    # https://github.com/libuv/libuv/issues/2975
    sed_in_place 's/!TARGET_OS_IPHONE/1/' src/unix/darwin.c
}

build() {
    cmake \
    -DLIBUV_BUILD_TESTS=OFF \
    -DLIBUV_BUILD_BENCH=OFF \
    -DQEMU=OFF &&
    mv "$ABI_INSTALL_DIR/lib/libuv_a.a" "$ABI_INSTALL_DIR/lib/libuv.a"
}
