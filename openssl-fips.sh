summary="Cryptography and SSL/TLS Toolkit"
homepage="https://openssl.org"
url="https://www.openssl.org/source/openssl-fips-2.0.16.tar.gz"
sha256="a3cd13d0521d22dd939063d3b4a0d4ce24494374b91408a05bdaca8b681c63d4"

prepare() {
    export CROSS_TOP="$DEVELOPER_DIR/Platforms/$TARGET_PLATFORM.platform/Developer"
    export CROSS_SDK="$TARGET_PLATFORM.sdk"
    export LC_COLLATE='C'
    export LC_CTYPE='C'
    sed_in_place 's|./fips_standalone_sha1$(EXE_EXT) fipscanister.o > fipscanister.o.sha1||g' fips/Makefile
}

build() {
    case $TARGET_PLATFORM in
        *Simulator)
            os_compiler='darwin64-x86_64-cc'
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
    
    unset TARGET_ARCH
    
    perl Configure \
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
