FROM rocker/verse:latest

MAINTAINER Shrek Tan "shrektan@126.com"

# Shrek's R docker image for CI

# Install Database related apt
RUN apt-get update && apt-get install -y --no-install-recommends \
    libaio1

# CRAN version packages

# install2.r is an cmd of linux by import litter. If the package is not available in CRAN, it will stop.
# Since rocker/verse has installed tidyverse, I will comment out the related pkgs. However, I'll keep
# them here so that I can explicitly be aware of that I'm using them.

# Tidyverse packages:
#   dplyr \
#   forcats \
#   httr \
#   lubridate \
#   purrr \
#   readr \
#   readxl \
#   stringr \
#   tibble \
#   tidyverse \
#   ggplot2 \
#   jsonlite \
#   xml2 \
#   rlang \
#   rvest \

# Knitr and related should have been installed
#    knitr \
#    yaml \

# installed in rocker/verse
#    tinytext \
#    devtools \
#    rmarkdown \

# TODO
# In the future we should use `Rscript -e "if (!requireNamespace('pkg', quitely = TRUE)) install.packages('pkg')"

RUN Rscript -e " \
install_pkgs <- function(pkgs) { \
  installed <- installed.packages(); \
  pkgs <- pkgs[!pkgs %in% installed]; \
  if (length(pkgs)) install.packages(pkgs, repos = 'https://cran.rstudio.com/');  \
}; \
pkgs <- c(\
'assertthat', 'config', 'covr', 'DBI', 'debugme', 'drat', 'feather',  \
'forecast', 'fs', 'fst', 'glue', 'infuser', 'PerformanceAnalytics', 'pkgconfig',  \
'pool', 'progress', 'R6', 'RColorBrewer', 'RcppArmadillo', 'RSQLite',  \
'svglite', 'testthat', 'usethis', 'V8', 'whoami', 'withr', 'writexl',  \
'xtable', 'xts', \
'ggthemes', 'ggrepel', 'ggpubr', \
'bookdown', 'blogdown' \
); \
install_pkgs(pkgs); \
"

# Github version packages
RUN R -e " \
devtools::install_github('Rdatatable/data.table'); \
devtools::install_github('rstudio/DT'); \
"
