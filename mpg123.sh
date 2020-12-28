summary "MP3 player"
webpage "https://www.mpg123.de"
src_url "https://www.mpg123.de/download/mpg123-1.26.3.tar.bz2"
src_sum "30c998785a898f2846deefc4d17d6e4683a5a550b7eacf6ea506e30a7a736c6e"
require "pkg-config"

build() {
    configure \
        --enable-debug=no \
        --enable-ipv6=yes \
        --with-default-audio=coreaudio \
        --with-module-suffix=.dylib \
        --with-cpu="$(cpu)"
}

cpu() {
    case $BUILD_FOR_ARCH in
        armv7*) echo neon   ;;
        arm64*) echo neon64 ;;
        i386)   echo i386   ;;
        x86_64) echo x86-64 ;;
        *)      echo "$BUILD_FOR_ARCH"
    esac
}
