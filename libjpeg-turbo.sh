summary="JPEG image codec that aids compression and decompression"
homepage="https://www.libjpeg-turbo.org"
url="https://downloads.sourceforge.net/project/libjpeg-turbo/2.0.4/libjpeg-turbo-2.0.4.tar.gz"
sha256="33dd8547efd5543639e890efbf2ef52d5a21df81faf41bb940657af916a23406"

build() {
    case $TARGET_ARCH in
        i386|x86_64)
            WITH_SIMD=ON;;
        *)  WITH_SIMD=OFF;;
    esac

    cmake \
    -DCMAKE_TOOLCHAIN_FILE="$CMAKE_TOOLCHAIN_FILE" \
    -DCMAKE_INSTALL_PREFIX="$DIR_INSTALL_PREFIX" \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_SHARED=OFF \
    -DENABLE_STATIC=ON \
    -DWITH_JAVA=OFF \
    -DWITH_SIMD="$WITH_SIMD" \
    -DFORCE_INLINE=ON \
    -G "Unix Makefiles" \
    -Wno-dev \
    -S "$DIR_SRC" \
    -B "$DIR_BUILD" &&
    make --directory="$DIR_BUILD" -j$(nproc) install 
}
