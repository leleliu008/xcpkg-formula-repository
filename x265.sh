summary="H.265/HEVC encoder"
homepage="http://x265.org"
url="https://bitbucket.org/multicoreware/x265/downloads/x265_3.4.tar.gz"
sha256="c2047f23a6b729e5c70280d23223cb61b57bfe4ad4e8f1471eeee2a61d148672"
version="3.4"

build() {
    cmake \
    -DENABLE_PIC=ON \
    -DENABLE_CLI=ON \
    -DENABLE_SHARED=OFF \
    -DENABLE_ASSEMBLY=OFF \
    -S "$DIR_SRC/source"
}
