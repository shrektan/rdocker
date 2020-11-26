FROM rocker/verse:4.0.3

MAINTAINER Shrek Tan "shrektan@126.com"

# Shrek's R docker image for CI

# if use multiple CPUs to install packages, default is 1
ARG ncpus
# use different mirrors if in China
ARG in_china

# With the following two lines I can test the image building locally in China
# https://blog.csdn.net/zmzwll1314/article/details/100557519
RUN if [ ${in_china:-0} = 1 ]; \
    then sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
         apt-get clean; \
    fi

# install2.r -se so that escape the installed packages, error if fails
RUN if [ ${in_china:-0} = 1 ]; \
    then export cran_repo="https://mirrors.e-ducation.cn/CRAN/"; \
    else export cran_repo="https://cran.rstudio.com/"; fi && \
    install2.r -se -r ${cran_repo} -n ${ncpus:-1} \
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
