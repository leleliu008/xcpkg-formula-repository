summary "Maintained ctags implementation"
webpage "https://github.com/universal-ctags/ctags"
src_url "https://github.com/universal-ctags/ctags.git"
require "autoreconf autoconf automake autoheader pkg-config cc"
depends "jansson libyaml libxml2"

prepare() {
    ./autogen.sh &&
    inject_stub_system main/sort.c
}

build() {
    ln -s "$SOURCE_DIR/Units" "$BUILD_DIR/Units" &&
    ln -s "$SOURCE_DIR/Tmain" "$BUILD_DIR/Tmain" &&
    configure --disable-seccomp --disable-static ac_cv_func_iconv_open=yes
}
