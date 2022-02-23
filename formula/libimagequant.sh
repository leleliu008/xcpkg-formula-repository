package set summary "Palette quantization library extracted from pnquant2"
package set webpage "https://pngquant.org/lib"
package set git.url "https://github.com/ImageOptim/libimagequant.git"
package set src.url "https://github.com/ImageOptim/libimagequant/archive/2.14.1.tar.gz"
package set src.sum "b5fa27da1f3cf3e8255dd02778bb6a51dc71ce9f99a4fc930ea69b83200a7c74"
package set license "GPL-3.0"
package set bsystem "cmake"

prepare() {
    sed_in_place 's|imagequant SHARED|imagequant STATIC|' CMakeLists.txt &&
    echo "\n" >> CMakeLists.txt &&
    echo 'install(TARGETS imagequant ARCHIVE DESTINATION lib)' >>     CMakeLists.txt &&
    echo 'install(FILES   libimagequant.h    DESTINATION include)' >> CMakeLists.txt
}

build() {
    cmakew -DBUILD_WITH_SSE=OFF && {
        cp "$SOURCE_DIR/imagequant.pc.in" imagequant.pc &&
        sed_in_place "s|PREFIX|$ABI_INSTALL_DIR|" imagequant.pc &&
        sed_in_place "s|VERSION|${PACKAGE_VERSION}|"      imagequant.pc &&
        install_pcfs imagequant.pc
    }
}
