install.packages(
  c(
    "remotes",
    "R6",
    "reticulate",
    "tensorflow",
    "keras",
    "tfruns",
    "visreg",
    "zeallot"),
    repos = "http://cran.us.r-project.org"
    )
reticulate::install_miniconda()
tensorflow::install_tensorflow()
reticulate::py_install("h5py")
