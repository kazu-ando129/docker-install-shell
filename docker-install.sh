#! /bin/bash

## -------------------------
# docker-install.sh
#
# install docker to ubuntu
## -------------------------

apt-get remove docker docker-engine docker.io containerd runc

apt-get update

apt-get install \
          apt-transport-https \
          ca-certificates \
          curl \
          gnupg-agent \
          software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable"

sudo apt-get update

apt-cache madison docker-ce

echo "----------------"
echo "input for install docker version"
echo "----------------"
read version

apt-get install docker-ce=$version \
                docker-ce-cli=$version \
                containerd.io

docker version
