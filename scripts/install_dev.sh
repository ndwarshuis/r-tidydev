#!/bin/bash

## build ARGs
NCPUS=${NCPUS:-1}

set -e

install2.r --error --skipinstalled -r $CRAN -n $NCPUS \
    ggpubr \
    lintr \
    formatR \
    stargazer

# install my own tools (assumes tidyverse is already installed)
R -e "devtools::install_github('ndwarshuis/dwarfsized', ref='ba7c322')"

rm -rf /tmp/downloaded_packages
