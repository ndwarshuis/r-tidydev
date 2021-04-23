## use rocker version stable as base and add tidyverse

## the rocker/tidyverse image has rstudio which increases the size by
## at least 500MB

FROM rocker/r-ver:4.0.4

## allow user to build faster
ARG MAKEFLAGS=-j2

## add the docker user
RUN useradd docker \
	&& mkdir /home/docker \
	&& chown docker:docker /home/docker \
	&& addgroup docker staff

## install tidyverse (assume this runs apt-get update -qq)
RUN /rocker_scripts/install_tidyverse.sh

## add X11 support for interactive plotting
COPY scripts/install_x11.sh /rocker_scripts/
RUN /rocker_scripts/install_x11.sh

## install dev packages
COPY scripts/install_dev.sh /rocker_scripts/
RUN /rocker_scripts/install_dev.sh
