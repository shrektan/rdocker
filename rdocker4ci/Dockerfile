FROM rocker/verse:latest

MAINTAINER Shrek Tan "shrektan@126.com"

# Shrek's R docker image for CI

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
"
