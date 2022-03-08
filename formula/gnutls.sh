package set summary "GNU Transport Layer Security (TLS) Library"
package set webpage "https://gnutls.org"
package set git.url "https://github.com/gnutls/gnutls.git"
package set src.url "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.3.tar.xz"
package set src.sum "fc59c43bc31ab20a6977ff083029277a31935b8355ce387b634fa433f8f6c49a"
package set dep.pkg "gmp libunistring nettle libtasn1 libidn2"
package set bsystem "configure"

# thread-local storage is not supported for the current target

prepare2() {
    inject_stub_system src/libopts/pgusage.c tests/pkcs11/pkcs11-mock2.c
}

build() {
    configure \
        --without-gcov \
        --without-p11-kit \
        --disable-valgrind-tests \
        --disable-code-coverage \
        --disable-gtk-doc \
        --disable-guile \
        --disable-tests \
        --enable-gcc-warnings
}
