package set summary "Low-level access to audio, keyboard, mouse, joystick and graphics"
package set webpage "https://www.libsdl.org"
package set git.url "https://github.com/libsdl-org/SDL.git"
package set src.url "https://libsdl.org/release/SDL2-2.0.20.tar.gz"
package set src.sum "c56aba1d7b5b0e7e999e4a7698c70b63a3394ff9704b5f6e1c57e0c16f04dd06"
package set license "Zlib"
package set bsystem "cmake"

build() {
    case $TARGET_OS_ARCH in
        arm*)
            _3DNOW=OFF
            ARMNEON=ON
            ARMSIMD=ON
            ;;
        i386|x86_64)
            _3DNOW=ON
            ARMNEON=OFF
            ARMSIMD=OFF
            ;;
        *)  _3DNOW=OFF
            ARMNEON=OFF
            ARMSIMD=OFF
    esac

    cmakew \
        -DSDL_SHARED=OFF \
        -DSDL_STATIC=ON \
        -DSDL_TEST=OFF \
        -DSDL_HAPTIC=OFF \
        -DSDL_JOYSTICK=OFF \
        -DSDL_POWER=OFF \
        -DPTHREADS=ON \
        -DPTHREADS_SEM=ON \
        -DPULSEAUDIO=OFF \
        -DLIBSAMPLERATE=OFF \
        -DALSA=OFF \
        -DASSEMBLY=ON \
        -D3DNOW="$_3DNOW" \
        -DARMNEON="$ARMNEON" \
        -DARMSIMD="$ARMSIMD" \
        -DVIDEO_OPENGL=OFF \
        -DVIDEO_OPENGLES=OFF \
        -DVIDEO_COCOA=OFF
}

build2() {
    configure
}
