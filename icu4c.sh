summary  "C/C++ and Java libraries for Unicode and globalization"
homepage "http://site.icu-project.org/home"
url      "https://github.com/unicode-org/icu/releases/download/release-67-1/icu4c-67_1-src.tgz"
version  "67.1"
sha256   "94a80cd6f251a53bd2a997f6f1b5ac6653fe791dfab66e1eb0227740fb86d5dc"
license  "ICU"

# https://www.talkwithdevices.com/archives/260
prepare() {
    SOURCE_DIR="$WORKING_DIR/source" &&
    cd "$SOURCE_DIR" &&
    mkdir build.d.tmp &&
    cd    build.d.tmp &&
    CC=/usr/bin/cc CXX=/usr/bin/c++ CPP=/usr/bin/cpp ../runConfigureICU MacOSX &&
    make &&
    cd "$SOURCE_DIR" &&
    cp config/mh-darwin config/mh-unknown &&
    inject_stub_system tools/tzcode/zic.c tools/pkgdata/pkgdata.cpp
}

build() {
    configure \
        --with-cross-build="$SOURCE_DIR/build.d.tmp" \
        --enable-release \
        --enable-tools \
        --enable-fuzzer \
        --disable-tests \
        --disable-samples
}
