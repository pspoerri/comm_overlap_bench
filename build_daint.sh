#!/usr/bin/env bash
rm -rf build
mkdir -p build

source modules_daint.sh
module list -t
echo

export CC=cc
export CXX=CC

export BOOST_ROOT="/apps/daint/UES/jenkins/6.0.UP02/gpu/easybuild/software/Boost/1.63.0-CrayGNU-2016.11-Python-3.5.2/"

pushd build &>/dev/null
    cmake .. -DCMAKE_CXX_FLAGS="-std=c++11" -DBOOST_ROOT="${BOOST_ROOT}" -DCUDA_COMPUTE_CAPABILITY="sm_60" -DCMAKE_BUILD_TYPE=Debug

    make -j 8

