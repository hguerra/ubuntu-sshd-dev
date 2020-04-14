#!/bin/sh

docker build -t heitorcarneiro/ubuntu-sshd-dev:18.04 .
docker push heitorcarneiro/ubuntu-sshd-dev:18.04
