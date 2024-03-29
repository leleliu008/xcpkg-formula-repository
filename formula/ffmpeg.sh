package set summary "Play, record, convert, and stream audio and video"
package set webpage "https://ffmpeg.org"
package set git.url "https://github.com/FFmpeg/FFmpeg.git"
package set src.url "https://ffmpeg.org/releases/ffmpeg-4.2.3.tar.xz"
package set src.sum "9df6c90aed1337634c1fb026fb01c154c29c82a64ea71291ff2da9aacb9aad31"
package set dep.pkg "sdl2 opus libwebp libvorbis theora speex x264 x265 lame"
package set bsystem "make"
package set binsrcd 'yes'

prepare() {
    sed_in_place 's/$_cc -v/$_cc --version/g' configure &&
    sed_in_place 's/cpuflags="-mcpu=$cpu"/[ -z "$cpu" ] || cpuflags="-mcpu=$cpu"/g' configure
}

build() {
    run ./configure \
        --prefix="$TARGET_INSTALL_DIR" \
        --sysroot="$SYSROOT" \
        --ar="$AR" \
        --as="$AS" \
        --cc="$CC" \
        --cxx="$CXX" \
        --nm="$NM" \
        --ranlib="$RANLIB" \
        --strip="$STRIP" \
        --arch="$TARGET_OS_ARCH" \
        --target-os=darwin \
        --enable-cross-compile \
        --enable-pic \
        --enable-static \
        --disable-shared \
        --disable-debug \
        --disable-asm \
        --disable-doc \
        --disable-programs &&
    makew clean &&
    makew install &&
    run cp ffbuild/config.log .
}
