package set summary "Core application library for C"
package set webpage "https://developer.gnome.org/glib"
package set git.url "https://github.com/GNOME/glib.git"
package set src.url "https://download.gnome.org/sources/glib/2.70/glib-2.70.4.tar.xz"
package set src.sum "ab3d176f3115dcc4e5d02db795984e04e4f4b48d836252e23e8c468e9d423c33"
package set license "LGPL-2.1-or-later"
package set bsystem "meson"
package set dep.pkg "gettext libiconv libffi pcre"

prepare() {
    sed_in_place '/build_tests =/a build_tests = false' meson.build &&
    sed_in_place 's|error (|message (|g' glib/gnulib/meson.build
}

build() {
    mesonw \
        -Dnls=disabled \
        -Dman=false \
        -Dgtk_doc=false \
        -Diconv=external \
        -Ddtrace=false \
        -Dinternal_pcre=false \
        -Dinstalled_tests=false \
        -Dbsymbolic_functions=false
}

build_configed() {
    sed_in_place "s|MacOSX$(xcrun --sdk macosx --show-sdk-version)|$TARGET_OS_NAME|g" build.ninja &&
    sed_in_place "s|MacOSX|$TARGET_OS_NAME|g"      build.ninja 
}
