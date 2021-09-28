package set summary "C library implementing the SSH2 protocol"
package set webpage "https://www.libssh2.org"
package set src.url "https://www.libssh2.org/download/libssh2-1.10.0.tar.gz"
package set src.sum "2d64e90f3ded394b91d3a2e774ca203a4179f69aebee03003e5a6fa621e41d51"
package set bsystem "configure"
package set dep.pkg "libgcrypt zlib"

build() {
    configure \
        --disable-examples-build \
        --disable-werror \
        --with-crypto=libgcrypt \
        --with-libgcrypt-prefix="$libgcrypt_INSTALL_DIR" \
        --with-libz
}
