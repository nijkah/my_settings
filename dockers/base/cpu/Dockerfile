FROM ubuntu:latest
MAINTAINER Hakjin Lee <nijkah@gmail.com>
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /

ENV PYTHON_VERSION="3.7.4"
ENV PYTHON_VERSION_NO_PATCH="3.7"
ENV OPENCV_VERSION="4.0.1"

# install essential packages
RUN apt-get update

# install default packages
RUN apt-get install -qq -y build-essential apt-utils checkinstall libreadline-gplv2-dev \
  libncursesw5-dev libc6-dev libswscale-dev libtbb2 libtbb-dev libbz2-dev 
RUN apt-get install -qq -y wget curl git zsh tmux tar cmake make unzip htop \
  pkg-config libjpeg-dev libtiff-dev libpng-dev libavformat-dev openssh-server

RUN apt-get update
RUN apt-get install -qq -y libffi-dev libssl-dev libsqlite3-dev

# Set Locale
RUN apt install locales -y
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN cd /usr/src \ 
 && wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz \
 && tar xzf Python-${PYTHON_VERSION}.tgz \
 && cd Python-${PYTHON_VERSION} \
 && ./configure --enable-optimizations \
 && make altinstall -j 32 \
 && mv /usr/local/bin/python${PYTHON_VERSION_NO_PATCH} /usr/local/bin/python3 \
 && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
 && python3 get-pip.py \
 && rm get-pip.py \
 && pip install numpy

RUN wget https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip \
  && unzip ${OPENCV_VERSION}.zip \
  && rm ${OPENCV_VERSION}.zip
RUN wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip \
  && unzip ${OPENCV_VERSION}.zip \
  && mkdir /opencv-${OPENCV_VERSION}/cmake_binary \
  && cd /opencv-${OPENCV_VERSION}/cmake_binary \
  && cmake -DBUILD_TIFF=ON \
           -DBUILD_opencv_java=OFF \
  	   -DOPENCV_EXTRA_MODULES_PATH=/opencv_contrib-${OPENCV_VERSION}/modules \
           -DWITH_CUDA=OFF \
           -DWITH_OPENGL=ON \
           -DWITH_OPENCL=ON \
           -DWITH_IPP=ON \
           -DWITH_TBB=ON \
           -DWITH_EIGEN=ON \
           -DWITH_V4L=ON \
           -DBUILD_TESTS=OFF \
           -DBUILD_PERF_TESTS=OFF \
           -DOPENCV_ENABLE_NONFREE=ON \
           -DCMAKE_BUILD_TYPE=RELEASE \
           -DCMAKE_INSTALL_PREFIX=$(python3 -c "import sys; print(sys.prefix)") \
           -DPYTHON_EXECUTABLE=$(which python${PYTHON_VERSION_NO_PATCH}) \
           -DPYTHON_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
           -DPYTHON_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
           .. \
  && make -j 32 \
  && make install
RUN ln -s \
  /usr/local/python/cv2/python-${PYTHON_VERSION_NO_PATCH}/cv2.cpython-37m-x86_64-linux-gnu.so \
  /usr/local/lib/python${PYTHON_VERSION_NO_PATCH}/site-packages/cv2.so

CMD ["zsh"]
