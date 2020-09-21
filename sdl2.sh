summary="Low-level access to audio, keyboard, mouse, joystick and graphics"
homepage="https://www.libsdl.org"
url="https://libsdl.org/release/SDL2-2.0.12.tar.gz"
sha256="349268f695c02efbc9b9148a70b85e58cefbbf704abd3e91be654db7f1e2c863"

build() {
    case $TARGET_ARCH in
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
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --disable-shared \
        --enable-static \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CXX="$CXX" \
        CXXFLAGS="$CXXFLAGS" \
        CPP="$CPP" \
        CXXCPP="$CXX -E" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" \
        PKG_CONFIG="" &&
    make clean &&
    make install
}
