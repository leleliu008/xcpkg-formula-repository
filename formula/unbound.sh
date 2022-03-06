package set summary "Validating, recursive, caching DNS resolver"
package set webpage "https://www.unbound.net"
package set git.url "https://github.com/NLnetLabs/unbound.git"
package set src.url "https://nlnetlabs.nl/downloads/unbound/unbound-1.15.0.tar.gz"
package set src.sum "a480dc6c8937447b98d161fe911ffc76cfaffa2da18788781314e81339f1126f"
package set license "BSD-3-Clause"
package set bsystem "configure"
package set dep.cmd "libtoolize libtool"
package set dep.pkg "openssl libevent expat nghttp2"

build() {
    configure \
        --disable-systemd \
        --disable-gost \
        --enable-flto \
        --enable-pie \
        --enable-event-api \
        --with-pthreads \
        --with-ssl="$openssl_INSTALL_DIR" \
        --with-libevent="$libevent_INSTALL_DIR" \
        --with-libexpat="$expat_INSTALL_DIR" \
        --with-libnghttp2="$nghttp2_INSTALL_DIR"
}
