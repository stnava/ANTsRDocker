print("Begin")
install.packages(
c(
"Rcpp", # "magrittr","dplyr","devtools",
"pander",
"pixmap",
"png",
"rmarkdown",
"rsvd",
"testthat",
"viridis" )
)
library( devtools )
if ( FALSE )
  install.packages(
  c(
  "abind",
  "caret",
  "cluster",
  "d3Network",
  "DMwR",
  "e1071",
  "extremevalues",
  "fastICA",
  "fpc",
  "ggplot2",
  "glasso",
  "glmnet",
  "grid",
  "irlba",
  "knitr",
  "lme4",
  "magic",
  "MASS",
  "mFilter",
  "misc3d",
  "moments",
  "nabor",
  "pander",
  "pracma",
  "prettydoc",
  "psych",
  "randomForest",
  "rflann",
  "rgl",
  "robust",
  "robustbase",
  "signal",
  "sna",
  "visreg",
  "wmtsa")
  )
# devtools::install_github("igraph/rigraph")
# devtools::install_github( "stnava/ANTsR")
