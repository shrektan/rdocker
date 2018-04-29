install_pkgs <- function(pkgs) {
  installed <- installed.packages()
  pkgs <- pkgs[!pkgs %in% installed]
  if (length(pkgs)) install.packages(pkgs, repos = 'https://cran.rstudio.com/')
}

pkgs <- c('assertthat', 'config', 'covr', 'DBI', 'debugme', 'drat', 'feather',
          'forecast', 'fs', 'fst', 'glue', 'infuser', 'PerformanceAnalytics', 'pkgconfig',
          'pool', 'progress', 'R6', 'RColorBrewer', 'RcppArmadillo', 'RSQLite',
          'svglite', 'testthat', 'usethis', 'V8', 'whoami', 'withr', 'writexl',
          'xtable', 'xts',
          'ggthemes', 'ggrepel', 'ggpubr',
          'bookdown', 'blogdown')

install_pkgs(pkgs)
