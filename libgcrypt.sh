summary="Cryptographic library based on the code from GnuPG"
homepage="https://gnupg.org/related_software/libgcrypt"
url="https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.6.tar.bz2"
sha256="0cba2700617b99fc33864a0c16b1fa7fdf9781d9ed3509f5d767178e5fd7b975"
dependencies="libgpg-error"

prepare() {
    gen_c_file_stub_system &&
    sed_in_place "1i #include\"$C_FILE_STUB_SYSTEM\"" tests/random.c &&
    sed_in_place 's/system (/stub_system (/g'         tests/random.c
}

build() {
    case $BUILD_FOR_ARCH in
        arm64|arm64e|x86_64)
            EXTRA_OPT='--disable-asm';;
        *)  EXTRA_OPT='--enable-asm'
    esac
    
    configure \
        --with-libgpg-error-prefix="$libgpg_error_INSTALL_DIR" \
        --disable-doc \
        --enable-optimization \
        "$EXTRA_OPT"
}
