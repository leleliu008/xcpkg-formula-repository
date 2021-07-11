package set summary "Cross-platform make"
package set webpage "https://www.cmake.org"
package set src.git "https://gitlab.kitware.com/cmake/cmake.git"
package set src.url "https://github.com/Kitware/CMake/releases/download/v3.19.7/cmake-3.19.7.tar.gz"
package set src.sum "58a15f0d56a0afccc3cc5371234fce73fcc6c8f9dbd775d898e510b83175588e"
package set license "BSD-3-Clause"
package set bsystem "cmake"
package set dep.pkg "ncurses libuv zlib"

prepare() {
    sed_in_place 's/ApplicationServices/CoreFoundation/g' Source/cmGlobalXCodeGenerator.cxx &&
    sed_in_place '/define HAVE_APPLICATION_SERVICES/d'    Source/cmGlobalXCodeGenerator.cxx &&
    sed_in_place 's|if(HAVE_CoreServices)|if(0)|'         Source/CMakeLists.txt
}

build() {
    cmakew \
        -DBUILD_QtDialog=OFF \
        -DBUILD_CursesDialog=ON \
        -DCMake_BUILD_LTO=ON \
        -DCMAKE_USE_SYSTEM_ZLIB=ON \
        -DCMAKE_USE_SYSTEM_LIBUV=ON \
        -DZLIB_INCLUDE_DIR="$zlib_INCLUDE_DIR" \
        -DZLIB_LIBRARY_RELEASE="$zlib_LIBRARY_DIR/libz.a" \
        -DLibUV_INCLUDE_DIR="$libuv_INCLUDE_DIR" \
        -DLibUV_LIBRARY="$libuv_LIBRARY_DIR/libuv.a" \
        -DCURSES_INCLUDE_PATH="$ncurses_INCLUDE_DIR" \
        -DCURSES_NCURSES_LIBRARY="$ncurses_LIBRARY_DIR/libncurses.a" \
        -DCURSES_FORM_LIBRARY="$ncurses_LIBRARY_DIR/libform.a"
}
