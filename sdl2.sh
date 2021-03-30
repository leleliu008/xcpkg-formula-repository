summary "Low-level access to audio, keyboard, mouse, joystick and graphics"
webpage "https://www.libsdl.org"
src_url "https://libsdl.org/release/SDL2-2.0.12.tar.gz"
src_sum "349268f695c02efbc9b9148a70b85e58cefbbf704abd3e91be654db7f1e2c863"
bsystem "cmake"

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

    cmake \
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
