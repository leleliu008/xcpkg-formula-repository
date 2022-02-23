package set summary "Compression/decompression library aiming for high speed"
package set webpage "https://google.github.io/snappy"
package set git.url "https://github.com/google/snappy.git"
package set src.url "https://github.com/google/snappy/archive/1.1.8.tar.gz"
package set src.sum "16b677f07832a612b0836178db7f374e414f94657c138e6993cbfc5dcc58651f"
package set bsystem "cmake"
package set license "BSD-3-Clause"

build() {
    cmakew \
        -DSNAPPY_BUILD_TESTS=OFF \
        -DSNAPPY_FUZZING_BUILD=OFF \
        -DSNAPPY_INSTALL=ON
}
