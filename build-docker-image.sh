#!/bin/sh

PCC_VERSION=2.4.3
#dokcer image build
docker build -t pccoss-build:$PCC_VERSION . 
