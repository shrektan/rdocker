install_pkgs <- function(pkgs, repos = 'https://cran.rstudio.com/') {
  installed <- installed.packages(noCache = FALSE)
  pkgs <- pkgs[!pkgs %in% rownames(installed)]
  if (length(pkgs)) {
    message('installing pkgs: ', toString(pkgs))
    install.packages(pkgs, repos = repos, quiet = TRUE)
  } else {
    message(sprintf(
      'pkgs %s have been installed already', toString(pkgs)
    ))
  }
}

gen_code <- function(pkgs) {
  txt <- sprintf('-e "install_pkgs(\'%s\')"', sort(pkgs))
  txt <- paste0('      ', txt)
  txt <- paste0(txt, collapse = ' \\\n')
  txt <- paste0('RUN R -e "source(\'/usr/bin/install_pkgs.R\')" \\\n', txt)
  if (interactive()) clipr::write_clip(txt) else cat(txt)
  invisible()
}

if (FALSE) {
  pkgs <- c(
    'bookdown', 'blogdown',
    "collapsibleTree", "data.tree",
    'echarts4r',
    'shiny', "shinyjs", "shinythemes", "shinydashboard", 'shinycssloaders',
    'bsplus', 'shinyWidgets',
    "highcharter", "htmlwidgets",
    "flexdashboard",
    "RPostgreSQL", "RJDBC",
    "openxlsx", "odbc", "plotly",
    "dygraphs", "d3heatmap", "DiagrammeR", "dtplyr",
    "leaflet", "extrafont", "mailR",
    "pander", "PKI", "RJSONIO", "showtext", "treemap", "viridisLite", "V8",
    "keyring", 'future', 'promises', 'swagger', 'Rglpk', 'RcppRoll',
    "plumber", "webutils", "sass", "gt",
    'assertthat', 'checkmate', 'commonmark',
    'config', 'covr', 'corrplot', 'DBI', 'data.table',
    'debugme', 'drat', 'feather', 'formatR',
    'forecast', 'fs', 'fst', 'glue',
    'ggthemes', 'ggrepel', 'ggpubr', 'huxtable',
    'PerformanceAnalytics', 'pkgconfig', 'pool', 'progress', 'Rcpp',
    'R6', 'RColorBrewer', 'RcppArmadillo', 'RSQLite', "rsvg", "RcppParallel", "roll",
    'svglite', 'testthat',
    'usethis',
    'whoami', 'withr', 'writexl',
    'xtable', 'xts', 'urltools',
    # pkgs that should have been installed
    # pkgs belongs to tidyverse
    'dplyr', 'forcats', 'httr', 'lubridate', 'purrr', 'readr', 'readxl', 'stringr',
    'tibble', 'tidyverse', 'ggplot2', 'jsonlite', 'xml2', 'rlang', 'rvest',
    'knitr', 'yaml'
  )
  gen_code(pkgs)
}
