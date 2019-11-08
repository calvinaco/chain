#!/usr/bin/env bash

CARGO_KCOV_FILE="${HOME}/.cargo/bin/cargo-kcov"
KCOV_FILE="/usr/local/bin/kcov"
ls "${HOME}/.cargo/bin"
ls /usr/local/bin
if [ ! -f "${CARGO_KCOV_FILE}" ] || [ ! -f "${KCOV_FILE}" ]; then
    echo "kcov is not installed"
    wget https://github.com/SimonKagstrom/kcov/archive/master.tar.gz
    tar xzf master.tar.gz
    cd kcov-master
    mkdir build
    cd build
    cmake ..
    make
    sudo make install
    cd ../..
    rm -rf kcov-master
fi
ls "${HOME}/.cargo/bin"
ls /usr/local/bin
