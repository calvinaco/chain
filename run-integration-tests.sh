#!/usr/bin/env bash
set -e

rustup default nightly-2019-08-01-x86_64-unknown-linux-gnu

# Build test environment
cd integration-tests
./prepare.sh
. ./env.sh
env
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