#!/usr/bin/env bash

curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
docker-compose up
rustup default nightly-2019-08-01-x86_64-unknown-linux-gnu

# Build test environment
cd integration-tests
./prepare.sh
. ./env.sh
docker-compose up -d

sleep 25

# Docker status
docker ps
docker-compose logs -t --tail="all"

# Preliminary tests
./run-test.sh

# Integration tests
cd client-rpc
yarn
yarn test

# Docker status after tests
docker ps