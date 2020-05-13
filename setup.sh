#!/bin/bash
sh -c '
#On Raspbian Stretch we need to install old libssl (1.02 to be exact)
apt-get update
apt-get purge -y libssl-dev
apt-get install -y libssl1.0-dev git cmake build-essential curl libcurl4-openssl-dev uuid-dev

#On Raspbian Stretch precompiled sdk from ppa is no good. Lets compile it manually
cd ~
mkdir Source
cd Source
git clone --recursive https://github.com/azure/azure-iot-sdk-c.git

cd azure-iot-sdk-c/build_all/linux
./build.sh --no-make

cd ../../cmake/iotsdk_linux
make

make install
'

