#!/bin/bash
set -e
THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $THIS_DIR
cp lib/balance_*.c*   caffe/src/caffe/layers/
cp lib/balance_*layer.hpp  caffe/include/caffe/layers/
cd $THIS_DIR/caffe
make all -j$(nproc) && make test -j$(nproc) && make pycaffe
cd $THIS_DIR
echo "Done!"
