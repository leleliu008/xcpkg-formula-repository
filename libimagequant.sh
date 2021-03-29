summary "Palette quantization library extracted from pnquant2"
webpage "https://pngquant.org/lib"
src_git "https://github.com/ImageOptim/libimagequant.git"
src_url "https://github.com/ImageOptim/libimagequant/archive/2.14.1.tar.gz"
src_sum "b5fa27da1f3cf3e8255dd02778bb6a51dc71ce9f99a4fc930ea69b83200a7c74"
license "GPL-3.0"
bsystem "cmake"

prepare() {
    sed_in_place 's|imagequant SHARED|imagequant STATIC|' CMakeLists.txt &&
    echo "\n" >> CMakeLists.txt &&
    echo 'install(TARGETS imagequant ARCHIVE DESTINATION lib)' >>     CMakeLists.txt &&
    echo 'install(FILES   libimagequant.h    DESTINATION include)' >> CMakeLists.txt
}

build() {
    cmake -DBUILD_WITH_SSE=OFF && {
        cp "$SOURCE_DIR/imagequant.pc.in" imagequant.pc &&
        sed_in_place "s|PREFIX|$ABI_INSTALL_DIR|" imagequant.pc &&
        sed_in_place "s|VERSION|$(version)|"      imagequant.pc &&
        install_pcfs imagequant.pc
    }
}
