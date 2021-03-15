summary "Library for manipulating PNG images"
webpage "http://www.libpng.org/pub/png/libpng.html"
src_url "https://downloads.sourceforge.net/libpng/libpng-1.6.37.tar.xz"
src_sum "505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca"
bsystem "cmake"
depends "zlib"

build() {
    cmake \
        -DPNG_STATIC=ON \
        -DPNG_SHARED=ON \
        -DPNG_TESTS=OFF \
        -DPNG_DEBUG=OFF \
        -DPNG_ARM_NEON=off \
        -DZLIB_INCLUDE_DIR="$zlib_INCLUDE_DIR" \
        -DZLIB_LIBRARY="$zlib_LIBRARY_DIR/libz.a"
}
