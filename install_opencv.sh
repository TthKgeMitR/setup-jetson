#!/bin/bash

password="swarm"
version="4.5.5"

# Overclock
#echo $password | sudo -S nvpmodel -m 0
#echo $password | sudo -S jetson_clocks

echo $password | sudo -S apt update

echo $password | sudo -S apt purge *libopencv*

# Installing build tools.
echo $password | sudo -S apt install -y build-essential cmake git curl
echo $password | sudo -S apt install -y libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
echo $password | sudo -S apt install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
echo $password | sudo -S apt install -y python2.7-dev python-dev python-numpy
echo $password | sudo -S apt install -y ibtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev
echo $password | sudo -S apt install -y libv4l-dev v4l-utils qv4l2 v4l2ucp

cd /opt
curl -L https://github.com/opencv/opencv/archive/${version}.zip -o opencv-${version}.zip
curl -L https://github.com/opencv/opencv_contrib/archive/${version}.zip -o opencv_contrib-${version}.zip
unzip opencv-${version}.zip
unzip opencv_contrib-${version}.zip
cd opencv-${version}



mkdir release
cd release

cmake \
    -D CMAKE_BUILD_TYPE=RELEASE \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D WITH_CUDA=ON \
    -D WITH_CUDNN=ON \
    -D CUDA_ARCH_BIN="5.3,6.2,7.2" \
    -D CUDA_ARCH_PTX="" \
    -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-${version}/modules \
    -D WITH_GSTREAMER=ON \
    -D WITH_LIBV4L=ON \
    -D BUILD_opencv_cudaarithm=ON -D BUILD_opencv_cudabgsegm=ON -D BUILD_opencv_cudacodec=ON \
    -D BUILD_opencv_cudafeatures2d=ON -D BUILD_opencv_cudafilters=ON -D BUILD_opencv_cudaimgproc=ON \
    -D BUILD_opencv_cudalegacy=ON -D BUILD_opencv_cudaobjdetect=ON -D BUILD_opencv_cudaoptflow=ON \
    -D BUILD_opencv_cudastereo=ON -D BUILD_opencv_cudawarping=ON -D BUILD_opencv_cudev=ON \
    -D BUILD_opencv_python2=ON \
    -D BUILD_opencv_python3=OFF \
    -D BUILD_TESTS=OFF \
    -D BUILD_PERF_TESTS=OFF \
    -D BUILD_EXAMPLES=OFF \
    -D CMAKE_INSTALL_PREFIX=/usr/local ..

make -j$(nproc)
echo ${password} | sudo -S make install

echo "Finished installing opencv-"${version}" succesfully."
