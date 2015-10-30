#!/bin/sh

PCC_VERSION=2.5.0
#dokcer image build
docker build -t pccoss-build:$PCC_VERSION .
