install_pkgs <- function(pkgs, repos = 'https://cran.rstudio.com/') {
  installed <- installed.packages()
  pkgs <- pkgs[!pkgs %in% installed]
  if (length(pkgs)) {
    message('installing pkgs: ', paste0(pkgs, collapse = ', '))
    install.packages(pkgs, repos = repos)
  } else {
    message('no new pkgs need to be installed.')
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
    "plumber", "webutils", "sass", "gt"
  )
  gen_code(pkgs)
}
