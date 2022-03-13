package set summary "Generic-purpose lossless compression algorithm by Google"
package set git.url "https://github.com/google/brotli.git"
package set src.url "https://github.com/google/brotli/archive/v1.0.9.tar.gz"
package set src.sum "f9e8d81d0405ba66d181529af42a3354f838c939095ff99930da6aa9cdf6fe46"
package set bsystem "cmake"

build() {
    cmakew || return 1
    cd "$ABI_LIBRARY_DIR" || return 1
    for item in libbrotlicommon libbrotlienc libbrotlidec
    do
        run mv "$item-static.a" "$item.a" || return 1
    done
}
