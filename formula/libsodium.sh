package set summary "A modern, portable, easy to use crypto library."
package set webpage "https://libsodium.org"
package set git.url "https://github.com/jedisct1/libsodium.git"
package set src.url "https://download.libsodium.org/libsodium/releases/libsodium-1.0.18.tar.gz"
package set src.sum "6f504490b342a4f8a4c4a02fc9b866cbef8622d5df4e5452b46be121e46636c1"
package set license "ISC"
package set bsystem "configure"

# ld: targeted OS version does not support use of thread local variables in _randombytes_internal_random for architecture x86_64
