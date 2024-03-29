package set summary "Cryptographic library based on the code from GnuPG"
package set webpage "https://gnupg.org/related_software/libgcrypt"
package set git.url "https://github.com/gpg/libgcrypt.git"
package set src.url "https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.6.tar.bz2"
package set src.sum "0cba2700617b99fc33864a0c16b1fa7fdf9781d9ed3509f5d767178e5fd7b975"
package set dep.pkg "libgpg-error"
package set bsystem "configure"

prepare() {
    inject_stub_system tests/random.c
}

build() {
    case $TARGET_OS_ARCH in
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
