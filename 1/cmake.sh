summary "Cross-platform make"
webpage "https://www.cmake.org"
src_url "https://github.com/Kitware/CMake/releases/download/v3.18.4/cmake-3.18.4.tar.gz"
src_sum "597c61358e6a92ecbfad42a9b5321ddd801fc7e7eca08441307c9138382d4f77"
license "BSD-3-Clause"
bsystem "cmake"
depends "libarchive libuv curl"

build() {
    cmake \
        -DBUILD_QtDialog=OFF \
        -DBUILD_CursesDialog=ON \
        -DCMake_BUILD_LTO=ON \
        -DCMAKE_USE_SYSTEM_ZLIB=ON \
        -DCMAKE_USE_SYSTEM_ZSTD=ON \
        -DCMAKE_USE_SYSTEM_BZIP2=ON \
        -DCMAKE_USE_SYSTEM_LIBLZMA=ON \
        -DCMAKE_USE_SYSTEM_CURL=ON \
        -DCMAKE_USE_SYSTEM_LIBARCHIVE=ON \
        -DCMAKE_USE_SYSTEM_LIBUV=ON \
        -DBZIP2_INCLUDE_DIR="$bzip2_INCLUDE_DIR" \
        -DBZIP2_LIBRARY="$bzip2_LIBRARY_DIR/libbz.a" \
        -DCURL_INCLUDE_DIR="$curl_INCLUDE_DIR" \
        -DCURL_LIBRARY="$curl_LIBRARY_DIR/libcurl.a" \
        -DLibArchive_INCLUDE_DIR="$libarchive_INCLUDE_DIR" \
        -DLibArchive_LIBRARY="$libarchive_LIBRARY_DIR/libarchive.a" \
        -DLibUV_INCLUDE_DIR="$libuv_INCLUDE_DIR" \
        -DLibUV_LIBRARY="$libuv_LIBRARY_DIR/libuv.a"
}
