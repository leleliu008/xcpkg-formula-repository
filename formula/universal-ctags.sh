package set summary "Maintained ctags implementation"
package set git.url "https://github.com/universal-ctags/ctags.git"
package set bsystem "autogen"
package set dep.cmd "pkg-config"
package set dep.pkg "jansson libyaml libxml2"

prepare() {
    ./autogen.sh &&
    inject_stub_system main/sort.c &&
    sed_in_place '/general.h/d' main/sort.c &&
    sed_in_place '1i #include "general.h"' main/sort.c
}

build() {
    configure --disable-seccomp --disable-static ac_cv_func_iconv_open=yes
}
