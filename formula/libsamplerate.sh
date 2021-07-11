package set summary "Library for sample rate conpackage set version of audio data"
package set webpage "http://www.mega-nerd.com/SRC"
package set src.url "http://www.mega-nerd.com/SRC/libsamplerate-0.1.9.tar.gz"
package set src.sum "0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1"
package set bsystem "autotools"
package set dep.pkg "libsndfile fftw"

prepare() {
    autoreconf -ivf &&
    sed_in_place '$d' autogen.sh && ./autogen.sh &&
    sed_in_place 's/(defined (__MACH__) && defined (__APPLE__))/0/g' examples/audio_out.c
}

build() {
    configure \
        --enable-sndfile \
        --enable-fftw
}
