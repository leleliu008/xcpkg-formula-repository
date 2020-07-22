summary="Ogg Bitstream Library"
homepage="https://www.xiph.org/ogg"
url="https://downloads.xiph.org/releases/ogg/libogg-1.3.4.tar.gz"
sha256="fe5670640bd49e828d64d2879c31cb4dde9758681bb664f9bdbf159a01b0c76e"

build() {
    cmake \
    -DCMAKE_TOOLCHAIN_FILE="$CMAKE_TOOLCHAIN_FILE" \
    -DCMAKE_INSTALL_PREFIX="$DIR_INSTALL_PREFIX" \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF \
    -DBUILD_SHARED_LIBS=OFF \
    -G "Unix Makefiles" \
    -Wno-dev \
    -S "$DIR_SRC" \
    -B "$DIR_BUILD" &&
    make --directory="$DIR_BUILD" -j$(nproc) install
}
