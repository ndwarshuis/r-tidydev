## use rocker version stable as base and add tidyverse
## the rocker/tidyverse image has rstudio which increases the size by
## at least 500MB
FROM rocker/r-ver:3.5.2

## allow user to build faster
ARG MAKEFLAGS=-j2
ARG ncpus=1

## add the docker user
RUN useradd docker \
	&& mkdir /home/docker \
	&& chown docker:docker /home/docker \
	&& addgroup docker staff

## install the entire tidyverse as well as dev-related packages
## and lintr
RUN apt-get update -qq \
    && apt-get -y --no-install-recommends install \
    libxml2-dev \
    libcairo2-dev \
    libsqlite-dev \
    libmariadbd-dev \
    libmariadb-client-lgpl-dev \
    libpq-dev \
    libssh2-1-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    && install2.r --error --ncpus $ncpus \
    --deps TRUE \
    tidyverse \
    dplyr \
    devtools \
    formatR \
    remotes \
    selectr \
    lintr \
    BiocManager

## install my own tools
RUN R -e "devtools::install_github('ndwarshuis/dwarfsized', ref='ba7c322')"
