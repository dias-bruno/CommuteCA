pkg_dir <- "C:/Bruno/packages/RDC_Packages"

install_order <- c("RColorBrewer" , "data.table" , "rJava" , "cli" , "generics" , "glue" , "magrittr" , "R6" , "rlang" , "utf8" , "fansi" , "pkgconfig" , "withr" , "isoband" , "MASS" , "farver" , "labeling" , "viridisLite" , "lattice" , "DBI", "Rcpp" , "KernSmooth" , "wk" , "proxy" , "base64enc", "abind" , "png" , "stringdist" , "colorspace" , "digest", "fastmap" , "jsonlite" , "yaml" , "xfun" , "curl" , "mime" , "dichromat" , "XML" , "lazyeval" , "rapidjsonr" , "evaluate" , "logger" , "fs" , "rappdirs" , "cpp11" , "stringi" , "rprojroot" , "sys" , "zip" , "backports" , "ca" , "cluster" , "qap" , "registry" , "codetools" , "iterators" , "permute" , "clipr" , "crayon" , "bit" , "prettyunits" , "lifecycle" , "class" , "nlme" , "Matrix" , "sp" , "units" , "terra" , "geometries" , "later" , "s2" , "htmltools" , "cachem" , "highr" , "tinytex" , "V8" , "jsonify" , "spacesXYZ" , "timechange" , "tzdb" , "here" , "askpass" , "checkmate" , "gclus" , "foreach" , "bit64" , "scales" , "vctrs" , "gtable" , "e1071" , "mgcv" , "raster" , "sfheaders" , "promises" , "crosstalk" , "jquerylib" , "leaflet.providers" , "fontawesome" , "sass" , "memoise" , "knitr" , "cols4all" , "lubridate" , "openssl" , "TSP" , "pillar" , "tidyselect" , "purrr" , "stringr" , "hms" , "classInt" , "vegan" , "geojsonsf" , "httpuv" , "bslib" , "httr" , "tibble" , "repr" , "slippymath" , "snakecase" , "progress" , "sf" , "seriation" , "servr" , "rmarkdown" , "dplyr" , "ggplot2" , "vroom" , "maptiles" , "stars" , "lwgeom" , "htmlwidgets" , "tidyr" , "cancensus" , "concaveman" , "ggridges" , "ggrepel" , "readr" , "tmaptools" , "leaflet" , "janitor" , "skimr" , "r5r" , "corrr" , "leafem" , "leafgl" , "leaflegend" , "leafsync" , "tmap")

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
