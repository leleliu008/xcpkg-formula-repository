package set summary "a tool for building and running mobile apps written in Go"
package set git.url "https://github.com/golang/mobile.git"
package set bsystem "go"

build() {
    export SDK=$(printf '%s\n' "$TARGET_OS_NAME" | tr A-Z a-z)
    echo SDK=$SDK
    for item in gobind gomobile
    do
        gow -x -buildmode c-archive -tags=ios ./cmd/$item || return 1
    done
}
