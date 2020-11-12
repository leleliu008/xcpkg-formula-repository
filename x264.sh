summary="H.264/AVC encoder"
homepage="https://www.videolan.org/developers/x264.html"
version="20191217-2245"
url="http://ftp.videolan.org/pub/x264/snapshots/x264-snapshot-$version.tar.bz2"
sha256="0bb67d095513391e637b3b47e8efc3ba4603c3844f1b4c2690f4d36da7763055"

prepare() {
    sed_in_place 's|ARCH="AARCH64"|ARCH="ARM"|' configure
}

build() {
    BUILD_FOR_HOST=$(echo "$BUILD_FOR_HOST" | sed 's/-ios/-darwin/')
    chmod a+x "$SOURCE_DIR/config.sub" &&
    configure \
        --disable-asm \
        --disable-cli \
        --disable-pic \
        --disable-lto \
        --disable-strip
}
