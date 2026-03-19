packages <- c(
  "mada",
  "meta",
  "metafor",
  "ggplot2",
  "dplyr",
  "tidyr",
  "scales",
  "gridExtra",
  "knitr"
)

install.packages(
  packages[!packages %in% installed.packages()[,"Package"]],
  repos = "https://cran.r-project.org"
)
