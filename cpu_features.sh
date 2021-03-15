summary "Cross platform C99 library to get cpu features at runtime"
webpage "https://github.com/google/cpu_features"
src_url "https://github.com/google/cpu_features/archive/v0.5.0.tar.gz"
src_sum "b967811cecd68412e0dc65e4964756a6ae48755456fa2c2f42034f6271ac2c27"
license "Apache-2.0"
bsystem "cmake"

prepare() {
    sed_in_place 's/\^arm/\^armv7/'               CMakeLists.txt &&
    sed_in_place 's/\^aarch64/\^(aarch64|arm64)/' CMakeLists.txt
}

build() {
    cmake -DBUILD_PIC=ON
}
