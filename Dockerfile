FROM ubuntu:18.04

# working directory
WORKDIR /darknet

# Add General build requirements 
RUN \ 
    apt-get update  && apt-get install -y \
    autoconf \
    automake \
    libtool \
    build-essential \
    git

# adds
RUN \ 
    apt-get install -y \
    wget 

# build darknet
RUN \
    git clone https://github.com/AlexeyAB/darknet.git \
    &&  cd darknet \
    &&  make  

# Custom object file 
COPY backup /darknet/darknet/backup/
COPY cfg /darknet/darknet/cfg/
COPY data /darknet/darknet/data

# Install Open CV Dependencies 
RUN apt-get update &&\
    apt-get install -y software-properties-common 

RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

RUN apt-get update && apt-get install -y \ 
    wget \
    build-essential \ 
    cmake \ 
    p7zip-full \ 
    pkg-config \
    python-dev \ 
    python-opencv \ 
    libopencv-dev \ 
    ffmpeg  \ 
    libjpeg-dev \ 
    libpng-dev \ 
    libtiff-dev \ 
    libjasper-dev \ 
    libgtk2.0-dev \ 
    python-numpy \ 
    python-pycurl \ 
    libatlas-base-dev \
    gfortran \
    webp \ 
    python-opencv \ 
    qt5-default \
    libvtk6-dev \ 
    zlib1g-dev  

# Download OpenCV
RUN \
    wget -O opencv-3.4.3.zip https://sourceforge.net/projects/opencvlibrary/files/opencv-unix/3.4.3/opencv-3.4.3.zip/download \ 
    && find / -name opencv-3.4.3.zip \
    && 7z x opencv-3.4.3.zip \
    && cd opencv-3.4.3 \
    && mkdir build \
    && cd build \
    && cmake -D WITH_QT=OFF -D WITH_XINE=ON -D WITH_OPENGL=ON -D WITH_TBB=ON -D BUILD_EXAMPLES=ON .. \
    && make \
    && make install \
    && echo "/usr/local/lib" >> /etc/ld.so.conf \
    && ldconfig
  


