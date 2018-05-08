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
  'bookdown', 'blogdown',
  'shiny', "shinyjs", "shinythemes", "shinydashboard",
  'bsplus', 'shinyWidgets',
  "highcharter", "htmlwidgets",
  "flexdashboard",
  "RPostgreSQL", "RJDBC",
  "openxlsx", "odbc", "plotly",
  "dygraphs", "d3heatmap", "DiagrammeR", "dtplyr",
  "leaflet", "extrafont", "mailR",
  "pander", "PKI", "RJSONIO", "showtext", "treemap", "viridisLite"
)

install_pkgs(pkgs)
