#!/bin/bash

if [ ! -z "${TRAVIS}" ]; then
    FILE="${HOME}/lib/libzmq.so"
    if [ ! -f "$FILE" ]; then
        echo "$FILE does not exist"
        wget --no-verbose https://github.com/jedisct1/libsodium/releases/download/1.0.16/libsodium-1.0.16.tar.gz
        tar xvfz libsodium-1.0.16.tar.gz
        cd libsodium-1.0.16
        ./configure --prefix=$HOME
        make
        make install
        cd ..

        wget --no-verbose https://github.com/zeromq/libzmq/releases/download/v4.3.2/zeromq-4.3.2.tar.gz
        tar xvfz zeromq-4.3.2.tar.gz
        cd zeromq-4.3.2
        ./configure --prefix=$HOME --with-libsodium
        make
        make install
        cd ..
    fi
else
    apt install libzmq3-dev -y
fi