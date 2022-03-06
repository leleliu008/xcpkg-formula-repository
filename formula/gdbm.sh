package set summary "GNU database manager"
package set webpage "https://www.gnu.org/software/gdbm/"
package set src.url "https://ftp.gnu.org/gnu/gdbm/gdbm-1.23.tar.gz"
package set src.sum "74b1081d21fff13ae4bd7c16e5d6e504a4c26f7cde1dca0d963a484174bbcacd"
package set license "GPL-3.0"
package set dep.cmd "gzip base64"
package set bsystem "configure"

# ld: warning: -flat_namespace is deprecated on iOS Simulator
# ld: targeted OS version does not support use of thread local variables in _gdbm_errno_location for architecture x86_64

build() {
    configure --enable-libgdbm-compat --without-readline
}
