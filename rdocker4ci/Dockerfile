FROM rocker/verse:latest

MAINTAINER Shrek Tan "shrektan@126.com"

# Shrek's R docker image for CI

# With the following two lines I can test the image building locally in China
# https://blog.csdn.net/zmzwll1314/article/details/100557519
# RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
# RUN  apt-get clean

# install2.r -s so that escape the installed packages

RUN install2.r -s -r "https://mirrors.e-ducation.cn/CRAN/" \
    assertthat \
    checkmate \
    commonmark \
    config \
    corrplot \
    covr \
    data.table \
    DBI \
    debugme \
    dplyr \
    drat \
    feather \
    forcats \
    forecast \
    formatR \
    fs \
    fst \
    ggplot2 \
    ggpubr \
    ggrepel \
    ggthemes \
    glue \
    httr \
    huxtable \
    jsonlite \
    knitr \
    lubridate \
    PerformanceAnalytics \
    pkgconfig \
    pool \
    progress \
    purrr \
    R6 \
    RColorBrewer \
    Rcpp \
    RcppArmadillo \
    RcppParallel \
    readr \
    readxl \
    rlang \
    roll \
    RSQLite \
    rsvg \
    rvest \
    stringr \
    svglite \
    testthat \
    tibble \
    tidyverse \
    urltools \
    usethis \
    whoami \
    withr \
    writexl \
    xml2 \
    xtable \
    xts \
    yaml
