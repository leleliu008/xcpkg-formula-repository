package set summary "H.264/AVC encoder"
package set webpage "https://www.videolan.org/developers/x264.html"
package set git.url "https://code.videolan.org/videolan/x264.git"
package set git.rev "5db6aa6cab1b146e07b60cc1736a01f21da01154"
package set version "r3060"
package set bsystem "configure"

prepare() {
    sed_in_place 's|ARCH="AARCH64"|ARCH="ARM"|' configure
}

build() {
    configure \
        --disable-asm \
        --disable-cli \
        --enable-pic \
        --enable-lto \
        --enable-strip
}
