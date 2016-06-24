#!/bin/bash
cd /primecloud-controller
git pull
mvn clean install -Dmaven.test.skip=true
chmod a+w /opt/pccbuild/
cp -r /primecloud-controller /opt/pccbuild/
echo "PrimeCloud Controller build phase was finished"
