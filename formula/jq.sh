package set summary "Lightweight and flexible command-line JSON processor"
package set webpage "https://stedolan.github.io/jq"
package set src.url "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-1.6.tar.gz"
package set src.sum "5de8c8e29aaa3fb9cc6b47bb27299f271354ebb72514e3accadc7d38b5bbaa72"
package set license "MIT"
package set bsystem "configure"
package set dep.pkg "oniguruma"
package set cdefine "_REENTRANT"

# ld: warning: -flat_namespace is deprecated on iOS Simulator
# ld: targeted OS package set version does not support use of thread local variables in _jv_nomem_handler for architecture x86_64


build() {
    configure --disable-maintainer-mode --with-oniguruma="$oniguruma_INSTALL_DIR"
}
