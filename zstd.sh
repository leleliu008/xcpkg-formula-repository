summary="Zstandard is a real-time compression algorithm"
homepage="https://facebook.github.io/zstd"
url="https://github.com/facebook/zstd/releases/download/v1.4.5/zstd-1.4.5.tar.gz"
sha256="98e91c7c6bf162bf90e4e70fdbc41a8188b9fa8de5ad840c401198014406ce9e"
dependencies="xz"
#dependencies="lz4"

build() {
    cmake \
    -DCMAKE_TOOLCHAIN_FILE="$CMAKE_TOOLCHAIN_FILE" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$DIR_INSTALL_PREFIX" \
    -DZSTD_BUILD_TESTS=OFF \
    -DZSTD_BUILD_CONTRIB=OFF \
    -DZSTD_BUILD_PROGRAMS=ON \
    -DZSTD_BUILD_STATIC=ON \
    -DZSTD_BUILD_SHARED=OFF \
    -DZSTD_MULTITHREAD_SUPPORT=ON \
    -DZSTD_ZLIB_SUPPORT=ON \
    -DZSTD_LZMA_SUPPORT=ON \
    -DLIBLZMA_INCLUDE_DIR="$xz_DIR_INCLUDE" \
    -DLIBLZMA_LIBRARY="$xz_DIR_LIB/liblzma.a" \
    -DZSTD_LZ4_SUPPORT=OFF \
    -G "Unix Makefiles" \
    -Wno-dev \
    -S build/cmake \
    -B "$DIR_BUILD" &&
    make --directory="$DIR_BUILD" install
}
