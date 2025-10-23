## INSTALL NESSECARY PACKAGES
packages <- c("sf", "skimr", "raster", "wader", "usethis", "here", "raster", "tidyverse")

installed <- rownames(installed.packages())
for (pkg in packages) {
  if (!(pkg %in% installed)) {
    message(paste("Installing package:", pkg))
    install.packages(pkg)
  }
}
lapply(packages, library, character.only = TRUE)

here()
use_default_data_path("~/EvergladesWadingBird")


## SOURCE INDIVIDUAL .R
source("Tyler.R")
source("Anjali.R")
source("Alessandro.R")
source("Jonathan.R")
## IMPUTATION, CLEANING, ETC. 
source("dataclean.R")

