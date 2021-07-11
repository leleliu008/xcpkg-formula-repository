package set summary "GNU Transport Layer Security (TLS) Library"
package set webpage "https://gnutls.org"
package set src.url "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.14.tar.xz"
package set src.sum "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
package set bsystem "configure"
package set dep.pkg "gmp libunistring nettle libtasn1 libidn2 p11-kit"

# thread-local storage is not supported for the current target

prepare() {
    inject_stub_system src/libopts/pgusage.c tests/pkcs11/pkcs11-mock2.c
}

build() {
    configure \
        --without-gcov \
        --disable-valgrind-tests \
        --disable-code-coverage \
        --disable-gtk-doc \
        --disable-guile \
        --enable-gcc-warnings
}
