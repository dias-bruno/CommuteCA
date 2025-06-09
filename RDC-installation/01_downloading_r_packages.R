
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
main_pkgs <- c("dplyr", "fitdistrplus", "scales", "here", "corrr",
               "janitor", "ggplot2", "ggridges", "readr", "skimr",
               "RColorBrewer", "sf", "tmap", "widgetframe", "tidyr",
               "rmarkdown", "knitr", "tufte", "DescTools", "poliscidata",
               "Hmisc", "weights")

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

