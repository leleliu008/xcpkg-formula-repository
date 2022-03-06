package set summary "Command-line packet(TCP/IP) analyzer"
package set webpage "https://www.tcpdump.org"
package set git.url "https://github.com/the-tcpdump-group/tcpdump.git"
package set src.url "https://www.tcpdump.org/release/tcpdump-4.99.1.tar.gz"
package set src.sum "79b36985fb2703146618d87c4acde3e068b91c553fb93f021a337f175fd10ebe"
package set bsystem "configure"
package set dep.pkg "libpcap"

build() {
    configure \
        --without-gcc \
        --disable-smb \
        --disable-universal
}
