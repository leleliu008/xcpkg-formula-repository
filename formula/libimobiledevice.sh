package set summary "Library to communicate with iOS devices natively"
package set webpage "https://www.libimobiledevice.org"
package set src.git "https://github.com/libimobiledevice/libimobiledevice.git"
package set src.url "https://github.com/libimobiledevice/libimobiledevice/releases/download/1.3.0/libimobiledevice-1.3.0.tar.bz2"
package set src.sum "53f2640c6365cd9f302a6248f531822dc94a6cced3f17128d4479a77bd75b0f6"
package set license "LGPL-2.1"
package set bsystem "configure"
package set dep.cmd "pkg-config"
package set dep.pkg "openssl libusbmuxd"

build() {
    configure --without-cython
}
