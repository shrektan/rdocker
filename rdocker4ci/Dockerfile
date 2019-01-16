FROM rocker/r-ver:latest

MAINTAINER Shrek Tan "shrektan@126.com"

# Shrek's R docker image for CI

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  file \
  git \
  libapparmor1 \
  libcurl4-openssl-dev \
  libedit2 \
  libssl-dev \
  lsb-release \
  psmisc \
  python-setuptools \
  sudo \
  wget \
  # The above lines are taken from rocker/rstudio
  # TODO we need to install the pandoc
  # I remember some database package needs libaio1
  libudunits2-dev \
  # libudunits2-dev is required by the units package
  libgit2-dev \
  # git2r
  libgeos-dev \
  # rgeos
  libaio1 \
  libxml2-dev \
  libcairo2-dev \
  libsqlite3-dev \
  libmariadbd-dev \
  libmariadb-client-lgpl-dev \
  libpq-dev \
  libssh2-1-dev \
  unixodbc-dev \
  # in order to install rsvg from the source
  librsvg2-dev \
  && install2.r --error \
    --deps TRUE \
    tidyverse \
    dplyr \
    ggplot2 \
    devtools \
    formatR \
    remotes \
    selectr \
    caTools
  # The above codes are from rocker/verse or rocker/tidyverse

# We don't use litter here is because I don't want to install packages
# that has already been installed.

COPY install_pkgs.R /usr/bin/install_pkgs.R

RUN R -e "source('/usr/bin/install_pkgs.R')"

# Github version packages
RUN R -e " \
devtools::install_github('Rdatatable/data.table'); \
devtools::install_github('rstudio/DT'); \
devtools::install_github('tidyverse/lubridate'); \
devtools::install_github('fstpackage/fst@develop'); \
"
