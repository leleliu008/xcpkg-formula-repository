summary "C library for creating IP packets"
webpage "https://github.com/sam-github/libnet"
src_url "https://github.com/libnet/libnet/releases/download/v1.2/libnet-1.2.tar.gz"
src_sum "caa4868157d9e5f32e9c7eac9461efeff30cb28357f7f6bf07e73933fb4edaa7"
license "BSD-2-Clause"

build() {
    BUILD_FOR_HOST=$(echo "$BUILD_FOR_HOST" | sed 's/-ios/-darwin/')
    configure --enable-samples
}
