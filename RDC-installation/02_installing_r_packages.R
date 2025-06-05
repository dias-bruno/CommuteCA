
###########################################
##### Install libraries for CommuteCA  ####
###########################################

# 1. Set the folder with the packages
pkg_dir <- paste0(here(), "/packages-to-install")

# 2. Define the installation order (copied and paste from the `01_downloading_r_packages.R` output)
install_order <- c("RColorBrewer",      "cli",               "generics",          "glue",              "magrittr",
"R6",                "rlang",             "utf8",              "fansi",             "pkgconfig",
"withr",             "MASS",              "lattice",           "farver",            "labeling",
"viridisLite",       "rprojroot",         "isoband",           "Rcpp",              "ca",
"cluster",           "colorspace",        "qap",               "registry",          "codetools",
"iterators",         "permute",           "stringi",           "cpp11",             "clipr",
"crayon",            "bit",               "prettyunits",       "evaluate",          "xfun",
"yaml",              "jsonlite",          "base64enc",         "digest",            "fastmap",
"DBI",               "KernSmooth",        "wk",                "proxy",             "data.table",
"abind",             "png",               "stringdist",        "curl",              "mime",
"dichromat",         "XML",               "lazyeval",          "rapidjsonr",        "logger",
"fs",                "rappdirs",          "lifecycle",         "class",             "Matrix",
"nlme",              "sp",                "here",              "units",             "terra",
"geometries",        "later",             "gclus",             "foreach",           "timechange",
"tzdb",              "bit64",             "highr",             "tinytex",           "htmltools",
"cachem",            "s2",                "jsonify",           "spacesXYZ",         "scales",
"vctrs",             "gtable",            "e1071",             "survival",          "mgcv",
"raster",            "sfheaders",         "promises",          "TSP",               "lubridate",
"knitr",             "crosstalk",         "jquerylib",         "leaflet.providers", "fontawesome",
"sass",              "memoise",           "cols4all",          "pillar",            "tidyselect",
"purrr",             "hms",               "stringr",           "classInt",          "fitdistrplus",
"vegan",             "geojsonsf",         "httpuv",            "bslib",             "tibble",
"repr",              "slippymath",        "progress",          "snakecase",         "sf",
"seriation",         "servr",             "rmarkdown",         "dplyr",             "ggplot2",
"vroom",             "maptiles",          "stars",             "lwgeom",            "tufte",
"htmlwidgets",       "tidyr",             "ggridges",          "ggrepel",           "readr",
"tmaptools",         "leaflet",           "janitor",           "skimr",             "corrr",
"leafem",            "widgetframe",       "leafgl",            "leaflegend",        "leafsync",
"tmap",              "CommuteCA")


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




