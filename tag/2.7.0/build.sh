#!/bin/bash
cd /primecloud-controller
git pull
mvn clean install -Dmaven.test.skip=true
cp -r /primecloud-controller /opt/pccbuild/
echo "PrimeCloud Controller build phase was finished"
