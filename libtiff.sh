summary="TIFF library and utilities"
homepage="https://libtiff.gitlab.io/libtiff"
url="https://download.osgeo.org/libtiff/tiff-4.1.0.tar.gz"
sha256="5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"

build() {
    cmake \
    -DCMAKE_TOOLCHAIN_FILE="$CMAKE_TOOLCHAIN_FILE" \
    -DCMAKE_INSTALL_PREFIX="$DIR_INSTALL_PREFIX" \
    -DCMAKE_BUILD_TYPE=Release \
    -Dzstd=OFF \
    -Dzlib=OFF \
    -Dlzma=OFF \
    -Dlzw=OFF \
    -Dwebp=OFF \
    -Djpeg=OFF \
    -G "Unix Makefiles" \
    -Wno-dev \
    -S "$DIR_SRC" \
    -B "$DIR_BUILD" &&
    make --directory="$DIR_BUILD" -j$(nproc) install
}
