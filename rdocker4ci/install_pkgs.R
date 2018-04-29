install_pkgs <- function(pkgs) {
  installed <- installed.packages()
  pkgs <- pkgs[!pkgs %in% installed]
  if (length(pkgs)) {
    message("installing pkgs: ", paste0(pkgs, collapse = ", "))
    install.packages(pkgs, repos = 'https://cran.rstudio.com/')
  } else {
    message("no new pkgs need to be installed.")
  }
}

pkgs <- c(
  'assertthat',
  'bookdown', 'blogdown',
  'config', 'covr', 'DBI',
  'debugme', 'drat', 'feather',
  'forecast', 'fs', 'fst', 'glue', 'infuser',
  'ggthemes', 'ggrepel', 'ggpubr',
  'PerformanceAnalytics', 'pkgconfig', 'pool', 'progress',
  'R6', 'RColorBrewer', 'RcppArmadillo', 'RSQLite',
  'svglite', 'testthat',
  'usethis',
  'V8',
  'whoami', 'withr', 'writexl',
  'xtable', 'xts',
  # pkgs that should have been installed
  # pkgs belongs to tidyverse
  'dplyr', 'forcats', 'httr', 'lubridate', 'purrr', 'readr', 'readxl', 'stringr',
  'tibble', 'tidyverse', 'ggplot2', 'jsonlite', 'xml2', 'rlang', 'rvest',
  'knitr', 'yaml'
)

install_pkgs(pkgs)

