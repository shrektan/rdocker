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
  # libudunits2-dev is required by the units package
  libudunits2-dev \
  # rgeos
  libgeos-dev \
  # getPass
  libsodium-dev \
  # sf (the below 4 libs)
  libudunits2-dev \
  libgdal-dev \
  libgeos-dev \
  libproj-dev \
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
    devtools \
    remotes \
    Rcpp
# The above codes are from rocker/verse or rocker/tidyverse

# We don't use litter here is because I don't want to install packages
# that has already been installed.

COPY install_pkgs.R /usr/bin/install_pkgs.R

RUN R -e "source('/usr/bin/install_pkgs.R')" \
      -e "install_pkgs('assertthat')" \
      -e "install_pkgs('config')" \
      -e "install_pkgs('corrplot')" \
      -e "install_pkgs('covr')" \
      -e "install_pkgs('data.table')" \
      -e "install_pkgs('DBI')" \
      -e "install_pkgs('debugme')" \
      -e "install_pkgs('dplyr')" \
      -e "install_pkgs('drat')" \
      -e "install_pkgs('feather')" \
      -e "install_pkgs('forcats')" \
      -e "install_pkgs('forecast')" \
      -e "install_pkgs('formatR')" \
      -e "install_pkgs('fs')" \
      -e "install_pkgs('fst')" \
      -e "install_pkgs('ggplot2')" \
      -e "install_pkgs('ggpubr')" \
      -e "install_pkgs('ggrepel')" \
      -e "install_pkgs('ggthemes')" \
      -e "install_pkgs('glue')" \
      -e "install_pkgs('httr')" \
      -e "install_pkgs('huxtable')" \
      -e "install_pkgs('infuser')" \
      -e "install_pkgs('jsonlite')" \
      -e "install_pkgs('knitr')" \
      -e "install_pkgs('lubridate')" \
      -e "install_pkgs('PerformanceAnalytics')" \
      -e "install_pkgs('pkgconfig')" \
      -e "install_pkgs('pool')" \
      -e "install_pkgs('progress')" \
      -e "install_pkgs('purrr')" \
      -e "install_pkgs('R6')" \
      -e "install_pkgs('RColorBrewer')" \
      -e "install_pkgs('Rcpp')" \
      -e "install_pkgs('RcppArmadillo')" \
      -e "install_pkgs('RcppParallel')" \
      -e "install_pkgs('readr')" \
      -e "install_pkgs('readxl')" \
      -e "install_pkgs('rlang')" \
      -e "install_pkgs('roll')" \
      -e "install_pkgs('RSQLite')" \
      -e "install_pkgs('rsvg')" \
      -e "install_pkgs('rvest')" \
      -e "install_pkgs('stringr')" \
      -e "install_pkgs('svglite')" \
      -e "install_pkgs('testthat')" \
      -e "install_pkgs('tibble')" \
      -e "install_pkgs('tidyverse')" \
      -e "install_pkgs('usethis')" \
      -e "install_pkgs('whoami')" \
      -e "install_pkgs('withr')" \
      -e "install_pkgs('writexl')" \
      -e "install_pkgs('xml2')" \
      -e "install_pkgs('xtable')" \
      -e "install_pkgs('xts')" \
      -e "install_pkgs('yaml')"
