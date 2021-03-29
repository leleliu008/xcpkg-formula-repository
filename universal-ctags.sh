summary "Maintained ctags implementation"
src_git "https://github.com/universal-ctags/ctags.git"
bsystem "autogen"
require "pkg-config"
depends "jansson libyaml libxml2"

prepare() {
    ./autogen.sh &&
    inject_stub_system main/sort.c
}

build() {
    configure --disable-seccomp --disable-static ac_cv_func_iconv_open=yes
}
