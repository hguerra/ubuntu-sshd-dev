#!/bin/sh

# Option 1 random port
# docker run -d -P --rm --name ubuntu heitorcarneiro/ubuntu-sshd-dev:18.04
# docker port ubuntu 22

# Option 2 4444 port
docker run -d -p "4444:22" --rm --name ubuntu heitorcarneiro/ubuntu-sshd-dev:18.04
ssh -o StrictHostKeyChecking=no vagrant@localhost -p 4444 -i ./keys/vagrant
