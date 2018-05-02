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
  # The above files are from rocker/rstudio
  # TODO we need to install the pandoc
  libaio1 \ # I remember some database package needs this
  libxml2-dev \
  libcairo2-dev \
  libsqlite3-dev \
  libmariadbd-dev \
  libmariadb-client-lgpl-dev \
  libpq-dev \
  libssh2-1-dev \
  unixodbc-dev \
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

RUN Rscript -e "source('/usr/bin/install_pkgs.R')"

# Github version packages
RUN R -e " \
devtools::install_github('Rdatatable/data.table'); \
devtools::install_github('rstudio/DT'); \
devtools::install_github('tidyverse/lubridate'); \
devtools::install_github('fstpackage/fst@develop'); \
"
