#!/bin/sh

PCC_VERSION=2.4.5
#dokcer image build
docker build -t pccoss-build:$PCC_VERSION .
