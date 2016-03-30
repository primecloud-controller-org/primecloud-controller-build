#!/bin/sh

PCC_VERSION=2.6.0
#dokcer image build
docker build -t pccoss-build:$PCC_VERSION tag/PCC_VERSION/
