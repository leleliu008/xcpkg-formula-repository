package set summary "A shell parser, formatter, and interpreter with bash support written in golang"
package set git.url "https://github.com/mvdan/sh.git"
package set src.url "https://github.com/mvdan/sh/archive/refs/tags/v3.4.1.tar.gz"
package set src.sum "a9e7a09dd0b099b8699b54af0e5911c19412dc7cea206e32377d974427688be1"
package set license "BSD-3-Clause"
package set bsystem "go"

build() {
    #export CGO_CFLAGS='-fembed-bitcode'
    export CGO_CFLAGS="-isysroot $SYSROOT"
    export CGO_CPPFLAGS="-isysroot $SYSROOT"
    export CGO_CXXFLAGS="-isysroot $SYSROOT"
    export CGO_LDFLAGS="-isysroot $SYSROOT"
    for item in gosh shfmt
    do
        gow -x -tags=ios -ldflags -linkmode=external -ldflags -v -ldflags "-extldflags \"$LDFLAGS\"" ./cmd/$item || return 1
    done
}
