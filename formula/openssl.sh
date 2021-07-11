package set summary "Cryptography and SSL/TLS Toolkit"
package set webpage "https://openssl.org"
package set src.git "https://github.com/openssl/openssl.git"
package set src.url "https://www.openssl.org/source/openssl-1.1.1g.tar.gz"
package set src.sum "ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46"
package set license "OpenSSL"
package set dep.cmd "perl"
package set bsystem "make"
package set binsrcd 'true'

#注意：1.0.2以上的openssl不支持openssl-fips，从openssl3.0开始支持新设计的openssl-fips
#https://github.com/openssl/openssl/issues/7582

build() {
    case $TARGET_OS_NAME in
        *Simulator)
            os_compiler='iossimulator-xcrun'
            ;;
        *)  case $TARGET_OS_ARCH in
                armv*)
                    os_compiler='ios-cross'
                    ;;
                arm64*)
                    os_compiler='ios64-cross'
                    ;;
            esac
    esac
    
    run ./Configure \
        no-ssl2 \
        no-ssl3 \
        no-comp \
        no-hw \
        no-engine \
        no-asm \
        --prefix="$ABI_INSTALL_DIR" \
        "$os_compiler" &&
    makew clean &&
    makew CROSS_COMPILE= &&
    makew CROSS_COMPILE= install
}
