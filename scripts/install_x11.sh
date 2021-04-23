#!/bin/bash

## build ARGs
NCPUS=${NCPUS:-1}

set -e

apt-get update -qq && apt-get install -y --no-install-recommends \
    libx11-6 \
    libxss1 \
    libxt6 \
    libxext6 \
    libsm6 \
    libice6 \
    xdg-utils && \
  rm -rf /var/lib/apt/lists/*
