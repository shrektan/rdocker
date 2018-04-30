FROM shrektan/rdocker4ci:latest

MAINTAINER Shrek Tan "shrektan@126.com"

# Install Database related apt
RUN apt-get update && apt-get install -y --no-install-recommends \
    libaio1 \
    unixodbc \
    unixodbc-dev \
    tdsodbc

# Shrek's own working environment

COPY install_pkgs.R /usr/bin/install_pkgs.R

RUN Rscript -e "source('/usr/bin/install_pkgs.R')"

# Github version packages
RUN R -e " \
# below packages are not on CRAN better not use
# devtools::install_github('Ather-Energy/ggTimeSeries'); \
# devtools::install_github('ricardo-bion/ggradar'); \
# devtools::install_github('trestletech/shinyStore'); \
"
