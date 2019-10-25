#!/usr/bin/env bash

rustup default nightly-2019-08-01-x86_64-unknown-linux-gnu
cd integration-tests
./prepare.sh
. ./env.sh
docker-compose up -d
sleep 25
docker ps
docker-compose logs -t --tail="all"
./run-test.sh
cd client-rpc
yarn
yarn test
docker ps