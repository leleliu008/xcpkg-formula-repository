package set summary "Object-file caching compiler wrapper"
package set webpage "https://ccache.dev"
package set git.url "https://github.com/ccache/ccache.git"
package set src.url "https://github.com/ccache/ccache/releases/download/v4.6/ccache-4.6.tar.xz"
package set src.sum "3d2bb860f4359169e640f60cf7cc11da5fab5fb9aed55230d78141e49c3945e9"
package set license "GPL-3.0-or-later"
package set dep.pkg "hiredis zstd blake3"
package set bsystem "cmake"

prepare() {
    sed_in_place 's|ifdef HAVE_AVX2|if 0|g'    src/hashutil.cpp &&
    sed_in_place 's|third_party/blake3/||'     src/Hash.hpp &&
    sed_in_place '/add_subdirectory(blake3)/d' src/third_party/CMakeLists.txt
}

build() {
    cmakew \
        -DENABLE_COVERAGE=OFF \
        -DENABLE_CPPCHECK=OFF \
        -DENABLE_IPO=OFF \
        -DENABLE_TRACING=OFF \
        -DWARNINGS_AS_ERRORS=OFF \
        -DZSTD_FROM_INTERNET=OFF \
        -DZSTD_INCLUDE_DIR="$zstd_INCLUDE_DIR" \
        -DZSTD_LIBRARY="$zstd_LIBRARY_DIR/libzstd.a"
}
