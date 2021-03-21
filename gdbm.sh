summary "GNU database manager"
webpage "https://www.gnu.org/software/gdbm/"
src_url "https://ftp.gnu.org/gnu/gdbm/gdbm-1.18.1.tar.gz"
src_sum "86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f745b91dc"
license "GPL-3.0"
bsystem "configure"

# ld: warning: -flat_namespace is deprecated on iOS Simulator
# ld: targeted OS version does not support use of thread local variables in _gdbm_errno_location for architecture x86_64

build() {
    configure --enable-libgdbm-compat --without-readline
}
