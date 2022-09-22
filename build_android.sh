#!/bin/bash

# config your ndk path, copy all header and lib of target arch to make the sysroot 
export NDK=/home/linjunhong/Desktop/crosswalk/src/third_party/android_ndk
export ANDROID_SYSROOT=/home/linjunhong/Desktop/android-23-sysroot_arm

export API=23
export TARGET=armv7a-linux-androideabi

export CFLAGS="--sysroot=$ANDROID_SYSROOT -I$ANDROID_SYSROOT/usr/include/arm-linux-androideabi -fPIE -pie"

export TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
export AR=$TOOLCHAIN/bin/arm-linux-androideabi-ar
export CC=$TOOLCHAIN/bin/arm-linux-androideabi-gcc
export AS=$TOOLCHAIN/bin/arm-linux-androideabi-as
export CXX=$TOOLCHAIN/bin/arm-linux-androideabi-g++
export CPP=$TOOLCHAIN/bin/arm-linux-androideabi-cpp
export LD=$TOOLCHAIN/bin/arm-linux-androideabi-ld
export RANLIB=$TOOLCHAIN/bin/arm-linux-androideabi-ranlib
export STRIP=$TOOLCHAIN/bin/arm-linux-androideabi-strip

BUILD_PATH=$(pwd)/build
OUTPUT_PATH=$BUILD_PATH/output

if [ ! -d $BUILD_PATH ]
then
    mkdir $BUILD_PATH
fi

cd $BUILD_PATH

autoreconf -vif ..

../configure --host=$TARGET --prefix=$OUTPUT_PATH

make
make install

cd -
