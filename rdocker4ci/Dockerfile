FROM rocker/r-ver:latest

MAINTAINER Shrek Tan "shrektan@126.com"

# Shrek's R docker image for CI

# from rocker/tidyverse

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  libcairo2-dev \
  libsqlite3-dev \
  libmariadbd-dev \
  libmariadb-client-lgpl-dev \
  libpq-dev \
  libssh2-1-dev \
  unixodbc-dev \
  && R -e "\ # I don't need the bioconductor pkgs
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


# Install Database related apt
RUN apt-get update && apt-get install -y --no-install-recommends \
    libaio1

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
