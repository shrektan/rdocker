is_installed <- function(x) {
  installed <- rownames(installed.packages(noCache = TRUE))
  x %in% installed
}
install_pkg <- function(x, ncpus, repos) {
  # x is a list whose names are the packages names and values are the building arguments
  x <- x[!is_installed(names(x))]
  x_special <- Filter(Negate(is.null), x)
  x_normal <- Filter(is.null, x)
  # install normal pkgs first
  message("Installing ", toString(names(x_normal)))
  install.packages(names(x_normal), repos = repos, Ncpus = ncpus, type = "source")
  # install speical pkgs one by one
  for (i in seq_along(x_special)) {
    pkg <- names(x_special)[i]
    param <- x_special[[i]]
    message("Installing ", pkg)
    args <- list(pkgs = pkg, repos = repos, Ncpus = ncpus, type = "source")
    args <- c(args, param)
    do.call(utils::install.packages, args)
  }
}

if (!requireNamespace("yaml")) install.packages("yaml")
pkgs <- yaml::read_yaml("r-pkgs.yml")
repos <- Sys.getenv("cran_repo")
ncpus <- Sys.getenv("ncpus")
npkgs <- Sys.getenv("npkgs")
stopifnot(nzchar(repos), nzchar(ncpus), nzchar(npkgs))
ncpus <- as.integer(ncpus)
npkgs <- as.integer(npkgs)
numb <- seq_along(pkgs)
cuts <- cut(numb, seq(0L, length(pkgs) + npkgs, by = npkgs))
for (cut in levels(cuts)) {
  x <- pkgs[cuts == cut]
  tryCatch(
    install_pkg(x, ncpus = ncpus, repos = repos),
    error = function(e) {
      stop(e)
    },
    finally = {
      # ensure all pkgs are installed successfully
      not_installed <- names(x)[!is_installed(names(x))]
      if (length(not_installed)) {
        stop(sprintf("Install pkgs (%s) failed", toString(not_installed)), call. = FALSE)
      }
    }
  )
}
