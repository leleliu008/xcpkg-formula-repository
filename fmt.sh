summary "Open-source formatting library for C++"
webpage "https://fmt.dev"
src_git "https://github.com/fmtlib/fmt.git"
src_url "https://github.com/fmtlib/fmt/archive/7.1.3.tar.gz"
src_sum "5cae7072042b3043e12d53d50ef404bbb76949dad1de368d7f993a15c8c05ecc"
license "MIT"
bsystem "cmake"

build() {
    cmake \
        -DFMT_FUZZ=OFF \
        -DFMT_TEST=OFF \
        -DFMT_INSTALL=ON \
        -DFMT_WERROR=OFF \
        -DFMT_PEDANTIC=OFF
}
