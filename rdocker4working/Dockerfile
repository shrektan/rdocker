FROM rocker/verse:latest

MAINTAINER Shrek Tan "shrektan@126.com"

# With the following two lines I can test the image building locally in China
# https://blog.csdn.net/zmzwll1314/article/details/100557519
# RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
# RUN  apt-get clean

# Install Database related apt
RUN apt-get update && apt-get install -y --no-install-recommends \
    libaio1 \
    unixodbc \
    unixodbc-dev \
    tdsodbc

# register Free TDS driver

COPY tds.driver.template /var/tds.driver.template
RUN odbcinst -i -d -f /var/tds.driver.template

# Shrek's own working environment

COPY install_pkgs.R /usr/bin/install_pkgs.R

## And some nice R packages for publishing-related stuff
RUN R -e "source('/usr/bin/install_pkgs.R')" \
      -e "install_pkgs('bookdown')" \
      -e "install_pkgs('rticles')" \
      -e "install_pkgs('rmdshower')" \
      -e "install_pkgs('DT')"

RUN R -e "source('/usr/bin/install_pkgs.R')" \
      -e "install_pkgs('assertthat')" \
      -e "install_pkgs('blogdown')" \
      -e "install_pkgs('bookdown')" \
      -e "install_pkgs('bsplus')" \
      -e "install_pkgs('checkmate')" \
      -e "install_pkgs('collapsibleTree')" \
      -e "install_pkgs('commonmark')" \
      -e "install_pkgs('config')" \
      -e "install_pkgs('corrplot')" \
      -e "install_pkgs('covr')" \
      -e "install_pkgs('d3heatmap')" \
      -e "install_pkgs('data.table')" \
      -e "install_pkgs('data.tree')" \
      -e "install_pkgs('DBI')" \
      -e "install_pkgs('debugme')" \
      -e "install_pkgs('DiagrammeR')" \
      -e "install_pkgs('dplyr')" \
      -e "install_pkgs('drat')" \
      -e "install_pkgs('dtplyr')" \
      -e "install_pkgs('dygraphs')" \
      -e "install_pkgs('echarts4r')" \
      -e "install_pkgs('extrafont')" \
      -e "install_pkgs('feather')" \
      -e "install_pkgs('flexdashboard')" \
      -e "install_pkgs('forcats')" \
      -e "install_pkgs('forecast')" \
      -e "install_pkgs('formatR')" \
      -e "install_pkgs('fs')" \
      -e "install_pkgs('fst')" \
      -e "install_pkgs('future')" \
      -e "install_pkgs('ggplot2')" \
      -e "install_pkgs('ggpubr')" \
      -e "install_pkgs('ggrepel')" \
      -e "install_pkgs('ggthemes')" \
      -e "install_pkgs('glue')" \
      -e "install_pkgs('gt')" \
      -e "install_pkgs('highcharter')" \
      -e "install_pkgs('htmlwidgets')" \
      -e "install_pkgs('httr')" \
      -e "install_pkgs('huxtable')" \
      -e "install_pkgs('jsonlite')" \
      -e "install_pkgs('keyring')" \
      -e "install_pkgs('knitr')" \
      -e "install_pkgs('leaflet')" \
      -e "install_pkgs('lubridate')" \
      -e "install_pkgs('mailR')" \
      -e "install_pkgs('odbc')" \
      -e "install_pkgs('openxlsx')" \
      -e "install_pkgs('pander')" \
      -e "install_pkgs('PerformanceAnalytics')" \
      -e "install_pkgs('pkgconfig')" \
      -e "install_pkgs('PKI')" \
      -e "install_pkgs('plotly')" \
      -e "install_pkgs('plumber')" \
      -e "install_pkgs('pool')" \
      -e "install_pkgs('progress')" \
      -e "install_pkgs('promises')" \
      -e "install_pkgs('purrr')" \
      -e "install_pkgs('R6')" \
      -e "install_pkgs('RColorBrewer')" \
      -e "install_pkgs('Rcpp')" \
      -e "install_pkgs('RcppArmadillo')" \
      -e "install_pkgs('RcppParallel')" \
      -e "install_pkgs('RcppRoll')" \
      -e "install_pkgs('readr')" \
      -e "install_pkgs('readxl')" \
      -e "install_pkgs('Rglpk')" \
      -e "install_pkgs('RJDBC')" \
      -e "install_pkgs('RJSONIO')" \
      -e "install_pkgs('rlang')" \
      -e "install_pkgs('roll')" \
      -e "install_pkgs('RPostgreSQL')" \
      -e "install_pkgs('RSQLite')" \
      -e "install_pkgs('rsvg')" \
      -e "install_pkgs('rvest')" \
      -e "install_pkgs('sass')" \
      -e "install_pkgs('shiny')" \
      -e "install_pkgs('shinycssloaders')" \
      -e "install_pkgs('shinydashboard')" \
      -e "install_pkgs('shinyjs')" \
      -e "install_pkgs('shinythemes')" \
      -e "install_pkgs('shinyWidgets')" \
      -e "install_pkgs('showtext')" \
      -e "install_pkgs('stringr')" \
      -e "install_pkgs('svglite')" \
      -e "install_pkgs('swagger')" \
      -e "install_pkgs('testthat')" \
      -e "install_pkgs('tibble')" \
      -e "install_pkgs('tidyverse')" \
      -e "install_pkgs('treemap')" \
      -e "install_pkgs('urltools')" \
      -e "install_pkgs('usethis')" \
      -e "install_pkgs('V8')" \
      -e "install_pkgs('viridisLite')" \
      -e "install_pkgs('webutils')" \
      -e "install_pkgs('whoami')" \
      -e "install_pkgs('withr')" \
      -e "install_pkgs('writexl')" \
      -e "install_pkgs('xml2')" \
      -e "install_pkgs('xtable')" \
      -e "install_pkgs('xts')" \
      -e "install_pkgs('yaml')"

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

RUN R -e "remotes::install_github('trestletech/plumber')"
