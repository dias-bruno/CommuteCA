
###########################################
##### Download libraries for CommuteCA ####
###########################################

# 1. Install the following packages
install.packages('miniCRAN')
install.packages('igraph')
install.packages('here')

# 2. Load the libraries
library('miniCRAN')
library('igraph')
library('here')

# 3. Set the download folder
pkg_dir <- paste0(here(), "/packages-to-install")
dir.create(pkg_dir, showWarnings = FALSE)

# 4. Defining the main libraries to install and checking their dependencies
main_pkgs <- c("corrr",
  "DescTools",
  "dplyr",
  "fitdistrplus",
  "ggplot2",
  "ggridges",
  "here",
  "Hmisc",
  "janitor",
  "knitr",
  "matlib",
  "poliscidata",
  "psych",
  "purrr",
  "RColorBrewer",
  "readr",
  "rmarkdown",
  "scales",
  "sf",
  "skimr",
  "spdep",
  "stringr",
  "survey",
  "tibble",
  "tidyr",
  "tmap",
  "tufte",
  "VGAM",
  "weights",
  "widgetframe")

pkgs_needed <- pkgDep(main_pkgs, suggests = FALSE, enhances = FALSE)


# 5. Download the packages and save them in the `packages-to-install` folder
download.packages(pkgs = pkgs_needed,
                  destdir = pkg_dir,
                  type = "source",
                  dependencies = TRUE)

# 6. Identify the installation order
dg <- makeDepGraph(pkgs_needed, suggests = FALSE, enhances = FALSE)

install_order <- names(igraph::topo_sort(dg))

print(install_order)

