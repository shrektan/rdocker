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
  'shiny', "shinyjs", "shinythemes", "shinydashboard",
  "highcharter", "htmlwidgets",
  "flexdashboard",
  "RPostgreSQL",
  "openxlsx", "odbc",
  "dygraphs", "d3heatmap", "DiagrammeR", "dtplyr",
  "leaflet", "extrafont", "mailR",
  "pander", "PKI", "RJSONIO", "showtext", "treemap", "viridisLite"
)

install_pkgs(pkgs)
