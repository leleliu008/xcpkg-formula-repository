package set summary "Open-source formatting library for C++"
package set webpage "https://fmt.dev"
package set git.url "https://github.com/fmtlib/fmt.git"
package set src.url "https://github.com/fmtlib/fmt/archive/7.1.3.tar.gz"
package set src.sum "5cae7072042b3043e12d53d50ef404bbb76949dad1de368d7f993a15c8c05ecc"
package set license "MIT"
package set bsystem "cmake"

build() {
    cmakew \
        -DFMT_FUZZ=OFF \
        -DFMT_TEST=OFF \
        -DFMT_INSTALL=ON \
        -DFMT_WERROR=OFF \
        -DFMT_PEDANTIC=OFF
}
