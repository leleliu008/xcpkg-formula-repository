summary "Utility to determine file types"
webpage "https://www.darwinsys.com/file"
src_url "https://astron.com/pub/file/file-5.39.tar.gz"
src_sum "f05d286a76d9556243d0cb05814929c2ecf3a5ba07963f8f70bfaaa70517fad1"
bsystem "configure"

build0() {
    configure
}

build() {
    export FILE_COMPILE=$NATIVE_BUILD_DIR/output/bin/file
    configure \
        --enable-zlib \
        --disable-bzlib \
        --disable-xzlib
}
