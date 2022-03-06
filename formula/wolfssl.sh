package set summary "Embedded SSL Library written in C"
package set webpage "https://www.wolfssl.com"
package set git.url "https://github.com/wolfSSL/wolfssl.git"
package set src.url "https://github.com/wolfSSL/wolfssl/archive/refs/tags/v5.2.0-stable.tar.gz"
package set src.sum "409b4646c5f54f642de0e9f3544c3b83de7238134f5b1ff93fb44527bf119d05"
package set bsystem "autogen"

# ld: targeted OS version does not support use of thread local variables in _benchmark_test for architecture x86_64
# https://stackoverflow.com/questions/52282646/build-error-targeted-os-version-does-not-support-use-of-thread-local-variables

build() {
    configure \
        --disable-asm \
        --disable-bump \
        --disable-examples \
        --disable-fortress \
        --disable-md5 \
        --disable-sniffer \
        --disable-webserver \
        --disable-shared \
        --enable-static \
        --enable-aesccm \
        --enable-aesgcm \
        --enable-alpn \
        --enable-blake2 \
        --enable-camellia \
        --enable-certgen \
        --enable-certreq \
        --enable-chacha \
        --enable-crl \
        --enable-crl-monitor \
        --enable-curve25519 \
        --enable-dtls \
        --enable-dh \
        --enable-ecc \
        --enable-eccencrypt \
        --enable-ed25519 \
        --enable-filesystem \
        --enable-hc128 \
        --enable-hkdf \
        --enable-inline \
        --enable-ipv6 \
        --enable-jni \
        --enable-keygen \
        --enable-ocsp \
        --enable-opensslextra \
        --enable-poly1305 \
        --enable-psk \
        --enable-rabbit \
        --enable-ripemd \
        --enable-savesession \
        --enable-savecert \
        --enable-sessioncerts \
        --enable-sha512 \
        --enable-sni \
        --enable-supportedcurves \
        --enable-tls13 \
        --enable-sp \
        --enable-fastmath \
        --enable-fasthugemath
}
