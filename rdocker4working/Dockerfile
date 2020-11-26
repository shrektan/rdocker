FROM shrektan/rdocker4ci:latest

MAINTAINER Shrek Tan "shrektan@126.com"

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

# Install Database related apt
RUN apt-get update && apt-get install -y --no-install-recommends \
    libaio1 \
    unixodbc \
    unixodbc-dev \
    tdsodbc

# register Free TDS driver
COPY tds.driver.template /var/tds.driver.template
RUN odbcinst -i -d -f /var/tds.driver.template

# install2.r -se so that escape the installed packages, error if fails
RUN if [ ${in_china:-0} = 1 ]; \
    then cran_repo="https://mirrors.e-ducation.cn/CRAN/"; \
    else cran_repo="https://cran.rstudio.com/"; fi && \
    install2.r -se -r ${cran_repo} -n ${ncpus:-1} \
    assertthat \
    blogdown \
    bookdown \
    bsplus \
    checkmate \
    collapsibleTree \
    commonmark \
    config \
    corrplot \
    covr \
    data.table \
    data.tree \
    DBI \
    debugme \
    DiagrammeR \
    dplyr \
    drat \
    dtplyr \
    DT \
    dygraphs \
    echarts4r \
    extrafont \
    feather \
    flexdashboard \
    forcats \
    forecast \
    formatR \
    fs \
    fst \
    future \
    ggplot2 \
    ggpubr \
    ggrepel \
    ggthemes \
    glue \
    gt \
    highcharter \
    htmlwidgets \
    httr \
    huxtable \
    jsonlite \
    keyring \
    knitr \
    leaflet \
    lubridate \
    mailR \
    odbc \
    openxlsx \
    pander \
    PerformanceAnalytics \
    pkgconfig \
    PKI \
    plotly \
    plumber \
    pool \
    progress \
    promises \
    purrr \
    R6 \
    RColorBrewer \
    Rcpp \
    RcppArmadillo \
    RcppParallel \
    RcppRoll \
    readr \
    readxl \
    Rglpk \
    RJDBC \
    RJSONIO \
    rlang \
    rmdshower \
    roll \
    RPostgreSQL \
    RSQLite \
    rsvg \
    rticles \
    rvest \
    sass \
    shiny \
    shinycssloaders \
    shinydashboard \
    shinyjs \
    shinythemes \
    shinyWidgets \
    showtext \
    stringr \
    svglite \
    swagger \
    testthat \
    tibble \
    tidyverse \
    treemap \
    urltools \
    usethis \
    V8 \
    viridisLite \
    webutils \
    whoami \
    withr \
    writexl \
    xml2 \
    xtable \
    xts \
    yaml

RUN if [ ${in_china:-0} = 1 ]; then \
    tlmgr option repository https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet; \
    fi

RUN tlmgr install ctex \
   # fullpage
   preprint \
   cmap \
   colortbl \
   # color
   graphics \
   booktabs \
   pdfpages \
   # array longtable multicol
   tools \
   footmisc \
   xcolor \
   hyperref \
   # pdflscape
   oberdiek \
   # pifont
   psnfss \
   # the following I don't know... but they are required...
   ms \
   fancyhdr \
   xecjk \
   ulem \
   environ \
   trimspaces \
   zhnumber \
   fandol \
   symbol

RUN tlmgr path add
