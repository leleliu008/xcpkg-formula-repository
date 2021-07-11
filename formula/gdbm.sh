package set summary "GNU database manager"
package set webpage "https://www.gnu.org/software/gdbm/"
package set src.url "https://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz"
package set src.sum "37ed12214122b972e18a0d94995039e57748191939ef74115b1d41d8811364bc"
package set license "GPL-3.0"
package set bsystem "configure"
package set dep.cmd "gzip base64"

# ld: warning: -flat_namespace is deprecated on iOS Simulator
# ld: targeted OS package set version does not support use of thread local variables in _gdbm_errno_location for architecture x86_64

build() {
    configure --enable-libgdbm-compat --without-readline
}
