#!/bin/sh

PCC_VERSION=2.5.1
#dokcer image build
docker build -t pccoss-build:$PCC_VERSION .
