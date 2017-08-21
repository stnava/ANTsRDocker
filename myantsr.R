print("Begin")
install.packages(
c(
"Rcpp", # "magrittr","dplyr","devtools",
"RcppEigen",
"magic",
"misc3d",
"pander",
"pixmap",
"png",
"rmarkdown",
"rsvd",
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
  "testthat",
  "visreg",
  "wmtsa")
  )
# devtools::install_github("igraph/rigraph")
devtools::install_github( "stnava/ANTsR")
