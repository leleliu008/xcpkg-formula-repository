package set summary "Zip file manipulation library with minizip 1.x compatibility layer"
package set git.url "https://github.com/zlib-ng/minizip-ng.git"
package set src.url "https://github.com/zlib-ng/minizip-ng/archive/3.0.5.tar.gz"
package set src.sum "1a248c378fdf4ef6c517024bb65577603d5146cffaebe81900bec9c0a5035d4d"
package set license "Zlib"
package set dep.pkg "zlib zstd bzip2"
package set dep.cmd "pkg-config"
package set bsystem "cmake"

prepare() {
    sed_in_place 's|if(COMMONCRYPTO_FOUND)|if(OFF)|' CMakeLists.txt
}
