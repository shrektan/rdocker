FROM rocker/r-ver:latest

MAINTAINER Shrek Tan "shrektan@126.com"

# Shrek's R docker image for CI

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  file \
  git \
  libapparmor1 \
  libclang-dev \
  libcurl4-openssl-dev \
  libedit2 \
  libssl-dev \
  lsb-release \
  multiarch-support \
  psmisc \
  procps \
  python-setuptools \
  sudo \
  wget \
  # The above lines are taken from https://hub.docker.com/r/rocker/rstudio/dockerfile
  libxml2-dev \
  libcairo2-dev \
  libsqlite-dev \
  libmariadbd-dev \
  libmariadbclient-dev \
  libpq-dev \
  libssh2-1-dev \
  unixodbc-dev \
  libsasl2-dev
  # The above lines are taken from https://hub.docker.com/r/rocker/tidyverse/dockerfile

# We don't use litter here is because I don't want to install packages
# that has already been installed.

COPY install_pkgs.R /usr/bin/install_pkgs.R

RUN R -e "source('/usr/bin/install_pkgs.R')" \
      -e "install_pkgs('remotes')" \
      -e "install_pkgs('devtools')" \
      -e "install_pkgs('Rcpp')"

RUN R -e "source('/usr/bin/install_pkgs.R')" \
      -e "install_pkgs('assertthat')" \
      -e "install_pkgs('checkmate')" \
      -e "install_pkgs('commonmark')" \
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
      -e "install_pkgs('urltools')" \
      -e "install_pkgs('usethis')" \
      -e "install_pkgs('whoami')" \
      -e "install_pkgs('withr')" \
      -e "install_pkgs('writexl')" \
      -e "install_pkgs('xml2')" \
      -e "install_pkgs('xtable')" \
      -e "install_pkgs('xts')" \
      -e "install_pkgs('yaml')"
