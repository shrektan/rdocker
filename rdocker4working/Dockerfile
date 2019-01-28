FROM shrektan/rdocker4ci:latest

MAINTAINER Shrek Tan "shrektan@126.com"

# The following code to install tinytex is copied from rocker/verse
# see https://github.com/rocker-org/rocker-versioned/blob/master/verse/Dockerfile

## Add LaTeX, rticles and bookdown support
## uses dummy texlive, see FAQ 8: https://yihui.name/tinytex/faq/
RUN wget "https://travis-bin.yihui.name/texlive-local.deb" \
  && dpkg -i texlive-local.deb \
  && rm texlive-local.deb \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    ## for rJava
    default-jdk \
    ## Nice Google fonts
    fonts-roboto \
    ## used by some base R plots
    ghostscript \
    ## used to build rJava and other packages
    libbz2-dev \
    libicu-dev \
    liblzma-dev \
    ## system dependency of hunspell (devtools)
    libhunspell-dev \
    ## system dependency of hadley/pkgdown
    libmagick++-dev \
    ## rdf, for redland / linked data
    librdf0-dev \
    ## for V8-based javascript wrappers
    libv8-dev \
    ## for jq queries
    libjq-dev \
    ## R CMD Check wants qpdf to check pdf sizes, or throws a Warning
    qpdf \
    ## For building PDF manuals
    texinfo \
    ## for git via ssh key
    ssh \
    less \
    vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  ## Use tinytex for LaTeX installation
  && wget -qO- \
    "https://github.com/yihui/tinytex/raw/master/tools/install-unx.sh" | \
    sh -s - --admin --no-path \
  && mv ~/.TinyTeX /opt/TinyTeX \
  && /opt/TinyTeX/bin/*/tlmgr path add \
  && tlmgr install metafont mfware inconsolata tex ae parskip listings \
  && tlmgr path add \
  && Rscript -e "source('https://install-github.me/yihui/tinytex'); tinytex::r_texmf()" \
  && chown -R root:staff /opt/TinyTeX \
  && chmod -R g+w /opt/TinyTeX \
  && chmod -R g+wx /opt/TinyTeX/bin \
  ## And some nice R packages for publishing-related stuff
  && install2.r --error --deps TRUE \
    bookdown rticles rmdshower DT

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

RUN R -e "source('/usr/bin/install_pkgs.R')" \
      -e "install_pkgs('blogdown')" \
      -e "install_pkgs('bookdown')" \
      -e "install_pkgs('bsplus')" \
      -e "install_pkgs('collapsibleTree')" \
      -e "install_pkgs('d3heatmap')" \
      -e "install_pkgs('data.tree')" \
      -e "install_pkgs('DiagrammeR')" \
      -e "install_pkgs('dtplyr')" \
      -e "install_pkgs('dygraphs')" \
      -e "install_pkgs('extrafont')" \
      -e "install_pkgs('flexdashboard')" \
      -e "install_pkgs('future')" \
      -e "install_pkgs('highcharter')" \
      -e "install_pkgs('htmlwidgets')" \
      -e "install_pkgs('keyring')" \
      -e "install_pkgs('leaflet')" \
      -e "install_pkgs('mailR')" \
      -e "install_pkgs('odbc')" \
      -e "install_pkgs('openxlsx')" \
      -e "install_pkgs('pander')" \
      -e "install_pkgs('PKI')" \
      -e "install_pkgs('plotly')" \
      -e "install_pkgs('promises')" \
      -e "install_pkgs('RJDBC')" \
      -e "install_pkgs('RJSONIO')" \
      -e "install_pkgs('RPostgreSQL')" \
      -e "install_pkgs('shiny')" \
      -e "install_pkgs('shinydashboard')" \
      -e "install_pkgs('shinyjs')" \
      -e "install_pkgs('shinythemes')" \
      -e "install_pkgs('shinyWidgets')" \
      -e "install_pkgs('showtext')" \
      -e "install_pkgs('swagger')" \
      -e "install_pkgs('treemap')" \
      -e "install_pkgs('V8')" \
      -e "install_pkgs('viridisLite')"

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

RUN R -e "devtools::install_github('trestletech/plumber')" \
      # readxl prefers dev version tibble
      -e "devtools::install_github('tidyverse/tibble')"
