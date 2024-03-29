package set summary "High quality MPEG Audio Layer III (MP3) encoder"
package set webpage "https://lame.sourceforge.io"
package set src.url "https://downloads.sourceforge.net/sourceforge/lame/lame-3.100.tar.gz"
package set src.sum "ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e"
package set bsystem "configure"

prepare() {
    # libtool: link: /Applications/Xcode_12.3.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -dynamiclib  -o .libs/libmp3lame.0.dylib  .libs/VbrTag.o .libs/bitstream.o .libs/encoder.o .libs/fft.o .libs/gain_analysis.o .libs/id3tag.o .libs/lame.o .libs/newmdct.o .libs/presets.o .libs/psymodel.o .libs/quantize.o .libs/quantize_pvt.o .libs/reservoir.o .libs/set_get.o .libs/tables.o .libs/takehiro.o .libs/util.o .libs/vbrquantize.o .libs/version.o .libs/mpglib_interface.o   -Wl,-force_load,../mpglib/.libs/libmpgdecoder.a  -lm  -O3 -isysroot /Applications/Xcode_12.3.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk -arch armv7 -Os -miphoneos-version-min=8.0 -isysroot /Applications/Xcode_12.3.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk -arch armv7 -miphoneos-version-min=8.0   -install_name  /Users/runner/.xcpkg/pkg/lame/iPhoneOS/armv7/lib/libmp3lame.0.dylib -compatibility_version 1 -current_version 1.0 -Wl,-single_module -Wl,-exported_symbols_list,.libs/libmp3lame-symbols.expsym
    # Undefined symbols for architecture armv7:
    # "_lame_init_old", referenced from:
    # -exported_symbol[s_list] command line option
    # ld: symbol(s) not found for architecture armv7
    # clang: error: linker command failed with exit code 1 (use -v to see invocation)
    # make[3]: *** [libmp3lame.la] Error 1

    sed_in_place '/lame_init_old/d' include/libmp3lame.sym
}

build() {
    configure \
        --without-dmalloc \
        --disable-frontend \
        --enable-nasm
}
