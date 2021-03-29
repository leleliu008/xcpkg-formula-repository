summary "C++ Phone Number library by Google"
src_git "https://github.com/google/libphonenumber.git"
src_url "https://github.com/google/libphonenumber/archive/v8.12.20.tar.gz"
src_sum "a318a40272587305c2e2d6f0663c06f6d7bdb0d0be0877bfd67518a3cdfffe33"
license "Apache-2.0"
require "pkg-config protoc"
depends "boost icu4c protobuf google-test"
sourced "cpp"
xxflags "-std=c++11"

prepare() {
    sed_in_place 's|list (APPEND CMAKE_C_FLAGS "-pthread")|set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread")|' CMakeLists.txt
}

build() {
    export LDFLAGS="$LDFLAGS $icu4c_LIBRARY_DIR/libicudata.a"
    cmake \
        -DBUILD_GEOCODER=OFF \
        -DBUILD_STATIC_LIB=ON \
        -DUSE_POSIX_THREAD=ON \
        -DUSE_ICU_REGEXP=ON \
        -DUSE_RE2=OFF \
        -DUSE_BOOST=ON \
        -DBoost_USE_STATIC_LIBS=ON \
        -DBoost_DIR="$boost_LIBRARY_DIR/cmake/Boost-1.73.0" \
        -DBoost_INCLUDE_DIR="$boost_INCLUDE_DIR" \
        -DBoost_SYSTEM_LIBRARY_RELEASE="$boost_LIBRARY_DIR/libboost_system.a" \
        -DBoost_THREAD_LIBRARY_RELEASE="$boost_LIBRARY_DIR/libboost_thread.a" \
        -DBoost_DATE_TIME_LIBRARY_RELEASE="$boost_LIBRARY_DIR/libboost_date_time.a" \
        -DGTEST_INCLUDE_DIR="$google_test_INCLUDE_DIR" \
        -DGTEST_LIB="$google_test_LIBRARY_DIR/libgtest.a" \
        -DRE2_INCLUDE_DIR="$re2_INCLUDE_DIR" \
        -DRE2_LIB="$re2_LIBRARY_DIR/libre2.a" \
        -DPROTOBUF_INCLUDE_DIR="$protobuf_INCLUDE_DIR" \
        -DPROTOBUF_LIB="$protobuf_LIBRARY_DIR/libprotobuf.a" \
        -DICU_I18N_INCLUDE_DIR="$icu4c_INCLUDE_DIR" \
        -DICU_I18N_LIB="$icu4c_LIBRARY_DIR/libicui18n.a" \
        -DICU_UC_INCLUDE_DIR="$icu4c_INCLUDE_DIR" \
        -DICU_UC_LIB="$icu4c_LIBRARY_DIR/libicuuc.a"
}
