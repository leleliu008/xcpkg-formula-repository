package set summary "Cryptography and SSL/TLS Toolkit"
package set webpage "https://openssl.org"
package set src.url "https://www.openssl.org/source/openssl-fips-2.0.16.tar.gz"
package set src.sum "a3cd13d0521d22dd939063d3b4a0d4ce24494374b91408a05bdaca8b681c63d4"
package set bsystem "make"
package set binsrcd 'yes'

prepare() {
    export LC_COLLATE='C'
    export LC_CTYPE='C'
    
    sed_in_place 's|./fips_standalone_sha1$(EXE_EXT) fipscanister.o > fipscanister.o.sha1||g' fips/Makefile &&
    sed_in_place 's|-O3 -arch armv7 -mios-version-min=7.0.0 -isysroot \\$(CROSS_TOP)/SDKs/\\$(CROSS_SDK)|\\$(CFLAGS)|' Configure &&
    sed_in_place 's|-O3 -arch arm64 -mios-version-min=7.0.0 -isysroot \\$(CROSS_TOP)/SDKs/\\$(CROSS_SDK)|\\$(CFLAGS)|' Configure
}

build() {
    case $TARGET_OS_NAME in
        MacOSX) os_compiler='darwin64-x86_64-cc' ;;
        *)  case $TARGET_OS_ARCH in
                armv*|i386)    os_compiler='ios-cross'   ;;
                arm64*|x86_64) os_compiler='ios64-cross' ;;
            esac
    esac
    
    run perl Configure \
        no-ssl2 \
        no-ssl3 \
        no-comp \
        no-hw \
        no-engine \
        no-asm \
        --prefix="$ABI_INSTALL_DIR" \
        "$os_compiler" &&
    makew clean &&
    makew install
}
