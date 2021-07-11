package set summary "an efficient feature complete C++ bittorrent implementation focusing on efficiency and scalability."
package set webpage "http://libtorrent.org"
package set src.git "https://github.com/arvidn/libtorrent.git"
package set src.url "https://github.com/arvidn/libtorrent/releases/download/v2.0.2/libtorrent-rasterbar-2.0.2.tar.gz"
package set src.sum "3af22ea1b60e04a7cf357a3d770470ea5df15e968501782bd1414634a2b42cb7"
package set bsystem "cmake"
package set dep.pkg "openssl boost"
package set xxflags "-std=c++14"

# deps/try_signal/try_signal.cpp:48:1: error: thread-local storage is not supported for the current target

build() {
    cmakew \
        -Dstatic_runtime=ON \
        -Dencryption=ON \
        -Dbuild_tools=ON \
        -Dbuild_tests=OFF \
        -Dbuild_examples=OFF \
        -Dpython-bindings=OFF \
        -DBoost_INCLUDE_DIR="$boost_INCLUDE_DIR"
}
