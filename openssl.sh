summary="Cryptography and SSL/TLS Toolkit"
homepage="https://openssl.org"
url="https://dl.bintray.com/homebrew/mirror/openssl-1.1.1g.tar.gz"
sha256="ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46"

#注意：1.0.2以上的openssl不支持openssl-fips，从openssl3.0开始支持新设计的openssl-fips
#https://github.com/openssl/openssl/issues/7582

build() {
    case $TARGET_PLATFORM in
        *Simulator)
            os_compiler='iossimulator-xcrun'
            ;;
        *)  case $TARGET_ARCH in
                armv*)
                    os_compiler='ios-cross'
                    ;;
                arm64*)
                    os_compiler='ios64-cross'
                    ;;
            esac
    esac
    ./Configure \
        no-ssl2 \
        no-ssl3 \
        no-comp \
        no-hw \
        no-engine \
        no-asm \
        --prefix="$DIR_INSTALL_PREFIX" \
        "$os_compiler" &&
    make clean &&
    make install
}
