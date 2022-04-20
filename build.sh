#!/bin/bash
BUILD_TYPE=Release
if [ -n $1 ] ; then
  BUILD_TYPE=$1
fi
#mkdir -p build
BUILD_DIR=./build
#mkdir -p ${BUILD_DIR}
cmake -DCMAKE_BUILD_TYPE=$1 -H. -B${BUILD_DIR}

cmake --build ${BUILD_DIR} -- VERBOSE=1


