package set summary "Generate C-based recognizers from regular expressions"
package set webpage "https://re2c.org"
package set git.url "https://github.com/skvadrik/re2c.git"
package set src.url "https://github.com/skvadrik/re2c/releases/download/3.0/re2c-3.0.tar.xz"
package set src.sum "b3babbbb1461e13fe22c630a40c43885efcfbbbb585830c6f4c0d791cf82ba0b"
package set bsystem "cmake"

build() {
    cmakew \
        -DRE2C_REBUILD_DOCS=OFF \
        -DRE2C_BUILD_RE2GO=OFF \
        -DRE2C_BUILD_LIBS=ON
}
