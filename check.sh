summary="C unit testing framework"
homepage="https://libcheck.github.io/check"
url="https://github.com/libcheck/check/releases/download/0.15.1/check-0.15.1.tar.gz"
sha256="c1cc3d64975c0edd8042ab90d881662f1571278f8ea79d8e3c2cc877dac60001"

build() {
    cmake \
    -DCMAKE_TOOLCHAIN_FILE="$CMAKE_TOOLCHAIN_FILE" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$DIR_INSTALL_PREFIX" \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_TESTING=OFF \
    -DCHECK_ENABLE_GCOV=OFF \
    -DINSTALL_CHECKMK=ON \
    -G "Unix Makefiles" \
    -Wno-dev \
    -S . \
    -B "$DIR_BUILD" &&
    make --directory="$DIR_BUILD" -j$(nproc) install
}
