#!/bin/bash

sudo apt-get update && \
sudo apt-get -y install \
build-essential \
git \
libsdl1.2-dev

git clone https://github.com/xobs/mcrpi-wrapper.git
mkdir mcrpi-wrapper
pushd mcrpi-wrapper
git apply ../0001-set-PocketCHIP-screen-resolution.patch
make
popd

wget https://github.com/xue-fei/chipcraft/raw/master/minecraft-pi-0.1.1.tar.gz
tar xf minecraft-pi-0.1.1.tar.gz
pushd mcpi
cp ../mcrpi-wrapper/libbcm_host.so.1.0 libbcm_host.so
mv ../start.sh .

