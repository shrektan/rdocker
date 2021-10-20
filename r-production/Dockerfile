FROM rocker/verse:4.1.0

LABEL maintainer="Shrek Tan <shrektan@126.com>"

# if use multiple CPUs to install packages, default is 1
ARG ncpus
# use different mirrors if in China
ARG in_china
# how many packages are installed for one time
ARG npkgs

# With the following two lines I can test the image building locally in China
# https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/
COPY china-sources.list /etc/apt/china-sources.list
RUN if [ ${in_china:-0} = 1 ]; \
    then mv /etc/apt/china-sources.list /etc/apt/sources.list; \
    else rm /etc/apt/china-sources.list; \
    fi

# required for msodbcsql17
RUN apt-get update && apt-get install -y --no-install-recommends \
    gnupg gnupg2 gnupg1 \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

# Install Database related apt; better install systemd to control services
RUN apt-get update && ACCEPT_EULA=Y apt-get install -y --no-install-recommends \
    systemd \
    libaio1 \
    unixodbc \
    unixodbc-dev \
    msodbcsql17 \
    # so that we can connect to the container via SSH
    # openssh-server \
    # install QuantLib so that we can build RQuantLib
    libquantlib0v5 quantlib-examples libquantlib0-dev \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY install-r-pkgs.R /root/install-rpkg/install-r-pkgs.R
COPY r-pkgs.yml /root/install-rpkg/r-pkgs.yml
WORKDIR /root/install-rpkg

# so that we can install binary R packages directly
RUN export cran_repo="https://packagemanager.rstudio.com/cran/__linux__/focal/latest" && \
    export npkgs=${npkgs:-1} && \
    export ncpus=${ncpus:-1} && \
    R -e "source('install-r-pkgs.R')" && \
    rm -r -f /root/install-rpkg

WORKDIR /root

RUN if [ ${in_china:-0} = 1 ]; then \
    tlmgr option repository https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet; \
    fi && \
    tlmgr update --self && \
    tlmgr install ctex \
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
    symbol \
    framed \
    pdflscape \
    unicode-math \
    fancyvrb && \
    tlmgr path add
