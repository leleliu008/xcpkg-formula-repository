summary  "JPEG image codec that aids compression and decompression"
homepage "https://www.libjpeg-turbo.org"
repo     "https://github.com/libjpeg-turbo/libjpeg-turbo.git"
url      "https://downloads.sourceforge.net/project/libjpeg-turbo/2.0.6/libjpeg-turbo-2.0.6.tar.gz"
sha256   "d74b92ac33b0e3657123ddcf6728788c90dc84dcb6a52013d758af3c4af481bb"
license  "IJG"
requirements "cmake make nasm"

build() {
    case $BUILD_FOR_ARCH in
        i386|x86_64)
            WITH_SIMD=ON;;
        *)  WITH_SIMD=OFF;;
    esac
    set -x
    cmake \
    -DENABLE_STATIC=ON \
    -DENABLE_SHARED=ON \
    -DWITH_JAVA=OFF \
    -DWITH_SIMD="$WITH_SIMD" \
    -DFORCE_INLINE=ON
}
