#!/bin/bash
cat /etc/issue

if [ ! -z "${TRAVIS}" ]; then
    sed -i 's/archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
    rm -rf /var/lib/apt/lists/*
fi
sudo apt update
sudo apt install wget curl -y
sudo apt install python3 libssl-dev libcurl4-openssl-dev libelf-dev libdw-dev  gcc binutils-dev libc6-dev -y
sudo apt install pkg-config -y
sudo apt install build-essential -y

command -v cmake > /dev/null
if [ x"$?" = "x1" ]; then
    if [ ! -z "${TRAVIS}" ]; then
        echo "cmake not found, installing ..."
        wget http://www.cmake.org/files/v3.2/cmake-3.2.2.tar.gz
        tar xf cmake-3.2.2.tar.gz
        cd cmake-3.2.2
        ./configure
        make
        make install
        cd ..
    else
        sudo apt install cmake -y
    fi
fi
cmake --version

command -v rustup > /dev/null
if [ x"$?" = "x1" ]; then
    echo "rustup not found, installing ..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    export PATH="${PATH}:$HOME/.cargo/bin"
fi
rustup update
rustup show

echo "prepare OK"
