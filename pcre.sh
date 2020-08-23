summary="Perl compatible regular expressions library"
homepage="https://www.pcre.org"
url="https://ftp.pcre.org/pub/pcre/pcre-8.44.tar.bz2"
sha256="19108658b23b3ec5058edc9f66ac545ea19f9537234be1ec62b714c84399366d"
dependencies="bzip2"

build() {
    cmake \
    -DCMAKE_TOOLCHAIN_FILE="$CMAKE_TOOLCHAIN_FILE" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$DIR_INSTALL_PREFIX" \
    -DBUILD_SHARED_LIBS=OFF \
    -DPCRE_BUILD_PCRE8=ON \
    -DPCRE_BUILD_PCRE16=ON \
    -DPCRE_BUILD_PCRE32=ON \
    -DPCRE_BUILD_PCREGREP=ON \
    -DPCRE_BUILD_PCRECPP=OFF \
    -DPCRE_BUILD_TESTS=OFF \
    -DPCRE_SUPPORT_VALGRIND=OFF \
    -DPCRE_SUPPORT_LIBZ=ON \
    -DPCRE_SUPPORT_LIBBZ2=ON \
    -DBZIP2_INCLUDE_DIR="$bzip2_DIR_INCLUDE" \
    -DBZIP2_LIBRARY_RELEASE="$bzip2_DIR_LIB/libbz2.a" \
    -G "Unix Makefiles" \
    -Wno-dev \
    -S . \
    -B "$DIR_BUILD" &&
    make --directory="$DIR_BUILD" -j$(nproc) install
}
