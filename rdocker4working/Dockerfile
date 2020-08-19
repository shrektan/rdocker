FROM shrektan/rdocker4ci:latest

MAINTAINER Shrek Tan "shrektan@126.com"

# The following code to install tinytex is copied from rocker/verse
# see https://hub.docker.com/r/rocker/verse/dockerfile

## Add LaTeX, rticles and bookdown support
RUN wget "https://travis-bin.yihui.name/texlive-local.deb" \
  && dpkg -i texlive-local.deb \
  && rm texlive-local.deb \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    curl \
    default-jdk \
    fonts-roboto \
    ghostscript \
    less \
    libbz2-dev \
    libicu-dev \
    liblzma-dev \
    libhunspell-dev \
    libjpeg-dev \
    libmagick++-dev \
    libopenmpi-dev \
    librdf0-dev \
    libtiff-dev \
    libv8-dev \
    libzmq3-dev \
    qpdf \
    ssh \
    texinfo \
    vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  ## Use tinytex for LaTeX installation
  && install2.r --error tinytex \
  ## Admin-based install of TinyTeX:
  && wget -qO- \
    "https://github.com/yihui/tinytex/raw/master/tools/install-unx.sh" | \
    sh -s - --admin --no-path \
  && mv ~/.TinyTeX /opt/TinyTeX \
  && if /opt/TinyTeX/bin/*/tex -v | grep -q 'TeX Live 2018'; then \
      ## Patch the Perl modules in the frozen TeX Live 2018 snapshot with the newer
      ## version available for the installer in tlnet/tlpkg/TeXLive, to include the
      ## fix described in https://github.com/yihui/tinytex/issues/77#issuecomment-466584510
      ## as discussed in https://www.preining.info/blog/2019/09/tex-services-at-texlive-info/#comments
      wget -P /tmp/ ${CTAN_REPO}/install-tl-unx.tar.gz \
      && tar -xzf /tmp/install-tl-unx.tar.gz -C /tmp/ \
      && cp -Tr /tmp/install-tl-*/tlpkg/TeXLive /opt/TinyTeX/tlpkg/TeXLive \
      && rm -r /tmp/install-tl-*; \
    fi \
  && /opt/TinyTeX/bin/*/tlmgr path add \
  && tlmgr install ae inconsolata listings metafont mfware parskip pdfcrop tex \
  && tlmgr path add \
  && Rscript -e "tinytex::r_texmf()" \
  && chown -R root:staff /opt/TinyTeX \
  && chmod -R g+w /opt/TinyTeX \
  && chmod -R g+wx /opt/TinyTeX/bin \
  && echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Renviron \
  && install2.r --error PKI \
  ## And some nice R packages for publishing-related stuff
  && install2.r --error --deps TRUE \
    bookdown rticles rmdshower rJava

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
      -e "install_pkgs('blogdown')" \
      -e "install_pkgs('bookdown')" \
      -e "install_pkgs('bsplus')" \
      -e "install_pkgs('collapsibleTree')" \
      -e "install_pkgs('d3heatmap')" \
      -e "install_pkgs('data.tree')" \
      -e "install_pkgs('DiagrammeR')" \
      -e "install_pkgs('dtplyr')" \
      -e "install_pkgs('dygraphs')" \
      -e "install_pkgs('echarts4r')" \
      -e "install_pkgs('extrafont')" \
      -e "install_pkgs('flexdashboard')" \
      -e "install_pkgs('future')" \
      -e "install_pkgs('gt')" \
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
      -e "install_pkgs('plumber')" \
      -e "install_pkgs('promises')" \
      -e "install_pkgs('RcppRoll')" \
      -e "install_pkgs('Rglpk')" \
      -e "install_pkgs('RJDBC')" \
      -e "install_pkgs('RJSONIO')" \
      -e "install_pkgs('RPostgreSQL')" \
      -e "install_pkgs('sass')" \
      -e "install_pkgs('shiny')" \
      -e "install_pkgs('shinycssloaders')" \
      -e "install_pkgs('shinydashboard')" \
      -e "install_pkgs('shinyjs')" \
      -e "install_pkgs('shinythemes')" \
      -e "install_pkgs('shinyWidgets')" \
      -e "install_pkgs('showtext')" \
      -e "install_pkgs('swagger')" \
      -e "install_pkgs('treemap')" \
      -e "install_pkgs('V8')" \
      -e "install_pkgs('viridisLite')" \
      -e "install_pkgs('webutils')"

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
