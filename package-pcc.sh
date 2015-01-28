#!/bin/sh
if [ ! -d /tmp/build ]; then
mkdir -p /tmp/pccbuild
fi

PCC_VERSION=2.4.3
PCC_BIN=PrimeCloud-Controller-$PCC_VERSION.tar.gz

docker run -i --name pccoss-build pccoss-build:$PCC_VERSION && rm -rf /opt/tmp/primecloud-controller && docker cp pccoss-build:/primecloud-controller /tmp/pccbuild && docker rm pccoss-build

if [ -d /work ]; then
rm -rf /work
fi

mkdir /work
cp /tmp/pccbuild/primecloud-controller/auto-tool/install-tool/target/$PCC_BIN /work
cd /work && tar zxvf /work/$PCC_BIN

