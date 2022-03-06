package set summary "an efficient feature complete C++ bittorrent implementation focusing on efficiency and scalability."
package set webpage "http://libtorrent.org"
package set git.url "https://github.com/arvidn/libtorrent.git"
package set src.url "https://github.com/arvidn/libtorrent/releases/download/v2.0.5/libtorrent-rasterbar-2.0.5.tar.gz"
package set src.sum "e965c2e53170c61c0db3a2d898a61769cb7acd541bbf157cbbef97a185930ea5"
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
