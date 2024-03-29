package set summary "Cross-platform make"
package set webpage "https://www.cmake.org"
package set git.url "https://gitlab.kitware.com/cmake/cmake.git"
package set src.url "https://github.com/Kitware/CMake/releases/download/v3.22.2/cmake-3.22.2.tar.gz"
package set src.sum "3c1c478b9650b107d452c5bd545c72e2fad4e37c09b89a1984b9a2f46df6aced"
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
