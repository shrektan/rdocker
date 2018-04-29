FROM rocker/verse:latest

MAINTAINER Shrek Tan "shrektan@126.com"

# Shrek's own working environment

# Install Database related apt
RUN apt-get update && apt-get install -y --no-install-recommends \
    libaio1

# CRAN version packages

# install2.r is an cmd of linux by import litter. If the package is not available in CRAN, it will stop.
# Since rocker/verse has installed tidyverse, I will comment out the related pkgs. However, I'll keep
# them here so that I can explicitly be aware of that I'm using them.

RUN install2.r --error \
    assertthat \
    bookdown \
    blogdown \
    covr \
    d3heatmap \
    DBI \
    debugme \
#   dplyr \
    dtplyr \
    drat \
    dygraphs \
    DiagrammeR \
    extrafont \
    feather \
    flexdashboard \
#   forcats \
    forecast \
    fs \
    fst \
#   ggplot2 \
    ggthemes \
    ggrepel \
    ggpubr \
    highcharter \
    htmlwidgets \
#   httr \
    infuser \
    jsonlite \
    knitr \
    leaflet \
#   lubridate \
    mailR \
    openxlsx \
    pander \
    PerformanceAnalytics \
    PKI \
    pkgconfig \
    pool \
    progress \
#   purrr \
    R6 \
    RcppArmadillo \
    RColorBrewer \
#   readr \
#   readxl \
    RJDBC \
    RJSONIO \
    RPostgreSQL \
    RcppArmadillo \
    RSQLServer \
    RSQLite \
    rmarkdown \
    rlang \
    rvest \
    shiny \
    shinyjs \
    shinythemes \
    shinydashboard \
    showtext \
#   stringr \
    svglite \
    testthat \
#   tibble \
#   tidyverse \
    treemap \
    usethis \
    V8 \
    viridisLite \
    whoami \
    withr \
    writexl \
    xml2 \
    xtable \
    xts \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Github version packages
RUN R -e " \
devtools::install_github('Rdatatable/data.table'); \
devtools::install_github('rstudio/DT'); \
# below packages are not on CRAN better not use
# devtools::install_github('Ather-Energy/ggTimeSeries'); \
# devtools::install_github('ricardo-bion/ggradar'); \
# devtools::install_github('trestletech/shinyStore'); \
"
