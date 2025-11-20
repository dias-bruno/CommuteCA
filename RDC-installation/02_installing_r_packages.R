
###########################################
##### Install libraries for CommuteCA  ####
###########################################

# 1. Set the folder with the packages
pkg_dir <- paste0(here(), "/packages-to-install")

# 2. Define the installation order (copied and paste from the `01_downloading_r_packages.R` output)
install_order <- c("RColorBrewer", "VGAM", "glue", "rlang", "cli",
                   "generics", "magrittr", "R6", "isoband", "S7",
                   "withr", "Rcpp", "ca", "cluster", "colorspace",
                   "MASS", "qap", "registry", "pkgconfig", "codetools",
                   "iterators", "utf8", "farver", "labeling", "viridisLite",
                   "permute", "lattice", "boot", "mvtnorm", "rstudioapi",
                   "data.table", "fs", "rootSolve", "lmom", "cpp11",
                   "curl", "jsonlite", "mime", "clipr", "crayon",
                   "rematch", "proxy", "prettyunits", "sys", "bit",
                   "rprojroot", "rpart", "nnet", "foreign", "base64enc",
                   "Formula", "digest", "fastmap", "evaluate", "xfun",
                   "yaml", "backports", "stringi", "rappdirs", "xtable",
                   "carData", "abind", "nloptr", "numDeriv", "SparseM",
                   "Deriv", "microbenchmark", "rbibutils", "plotrix", "gtools",
                   "KernSmooth", "bitops", "DBI", "shape", "pan",
                   "ucminf", "mnormt", "GPArotation", "wk", "deldir",
                   "png", "stringdist", "XML", "lazyeval", "rapidjsonr",
                   "logger", "otel", "lifecycle", "minqa", "RcppEigen",
                   "plyr", "RcppArmadillo", "units", "terra", "geometries",
                   "later", "gclus", "class", "foreach", "nlme",
                   "Matrix", "sp", "Exact", "tzdb", "timechange",
                   "askpass", "bit64", "here", "htmltools", "cachem",
                   "highr", "tinytex", "checkmate", "descr", "Rdpack",
                   "gdata", "caTools", "mitools", "s2", "jsonify",
                   "spacesXYZ", "scales", "vctrs", "gtable", "sfheaders",
                   "promises", "e1071", "TSP", "psych", "mgcv",
                   "expm", "survival", "MatrixModels", "ordinal", "spData",
                   "raster", "lubridate", "openssl", "fontawesome", "jquerylib",
                   "sass", "crosstalk", "leaflet.providers", "memoise", "knitr",
                   "reformulas", "gplots", "cols4all", "purrr", "stringr",
                   "pillar", "tidyselect", "hms", "ggplot2", "gridExtra",
                   "geojsonsf", "httpuv", "gld", "classInt", "vegan",
                   "fitdistrplus", "survey", "glmnet", "quantreg", "httr",
                   "bslib", "lme4", "slippymath", "snakecase", "tibble",
                   "repr", "progress", "ggridges", "ggrepel", "cowplot",
                   "servr", "sf", "seriation", "rmarkdown", "dplyr",
                   "forcats", "cellranger", "jomo", "vroom", "spdep",
                   "maptiles", "stars", "lwgeom", "tufte", "htmlwidgets",
                   "corrr", "tidyr", "readxl", "readr", "tmaptools",
                   "widgetframe", "htmlTable", "rgl", "leaflet", "janitor",
                   "skimr", "broom", "haven", "Hmisc", "leafem",
                   "leafgl", "leaflegend", "leafsync", "modelr", "DescTools",
                   "mitml", "tmap", "doBy", "mice", "pbkrtest",
                   "weights", "car", "matlib", "poliscidata")


# 3. Install the packages
for(pkg in install_order){

  pkg_file <- list.files(
    path = pkg_dir,
    pattern = paste0("^", pkg, "_.*\\.tar\\.gz"),
    full.names = TRUE
  )

  if(length(pkg_file) > 0){
    install.packages(pkg_file, repos = NULL, type = "source")
    message("Installed: ", pkg)
  } else {
    warning("Package not found: ", pkg)
  }
}

# 4. Installing a specific version of the `tmap` library
remove.packages("tmap") # Removing the most recent version

tmap_file <- list.files(path = pkg_dir,
  pattern = "tmap_3.3-4.tar.gz", # Installing the correct version
  full.names = TRUE)

install.packages(tmap_file, repos = NULL, type = "source")

# 5. Installing `CommuteCA` library

commuteca_file <- list.files(path = pkg_dir,
                        pattern = "CommuteCA_3.4.tar.gz", # Installing the correct version
                        full.names = TRUE)

install.packages(commuteca_file, repos = NULL, type = "source")

