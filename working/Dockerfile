FROM shrektan/rdocker4ci:latest

MAINTAINER Shrek Tan "shrektan@126.com"

# Shrek's own working environment

RUN install2.r --error \
    d3heatmap \
    dtplyr \
    drat \
    dygraphs \
    extrafont \
    mailR \
    RJDBC \
    RJSONIO \
    RSQLServer \
    showtext \
    treemap \
    viridisLite \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Github version packages
RUN R -e " \
# below packages are not on CRAN better not use
# devtools::install_github('Ather-Energy/ggTimeSeries'); \
# devtools::install_github('ricardo-bion/ggradar'); \
# devtools::install_github('trestletech/shinyStore'); \
"
