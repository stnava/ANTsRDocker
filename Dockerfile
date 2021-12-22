FROM rocker/binder:latest

USER root
COPY . ${HOME}
COPY --chown=rstudio:rstudio . ${HOME}
RUN chown -R ${NB_USER} ${HOME}


COPY . /usr/local/src/scripts
COPY ./scripts/* /usr/local/src/scripts/
WORKDIR /usr/local/src/scripts
RUN chmod a+rwx /usr/local/src/scripts/*
RUN export PATH="${PATH}:/root/.local/bin"
RUN apt-get update; \
    apt-get -y upgrade
RUN apt-get -y install cmake curl
RUN apt-get install -y python3 python3-pip
RUN apt-get install -y libv8-dev
RUN mkdir -p /root/.cache/pip
RUN chown -R ${NB_USER} /root/.cache/pip
## Run an install.R script, if it exists.
RUN if [ -f install.R ]; then R --quiet -f install.R; fi

RUN Rscript -e 'remotes::install_version("BGLR")' \
    && Rscript -e 'remotes::install_version("DMwR")' \
    && Rscript -e 'remotes::install_version("FNN")' \
    && Rscript -e 'remotes::install_version("RANN")' \
    && Rscript -e 'remotes::install_version("RGCCA")' \
    && Rscript -e 'remotes::install_version("Rcpp")' \
    && Rscript -e 'remotes::install_version("RcppEigen" )' \
    && Rscript -e 'remotes::install_version("RcppHNSW" )' \
    && Rscript -e 'remotes::install_version("abind" )' \
    && Rscript -e 'remotes::install_version("caret" )' \
    && Rscript -e 'remotes::install_version("corpcor" )' \
    && Rscript -e 'remotes::install_version("dplyr" )' \
    && Rscript -e 'remotes::install_version("e1071" )' \
    && Rscript -e 'remotes::install_version("fastICA" )' \
    && Rscript -e 'remotes::install_version("fpc" )' \
    && Rscript -e 'remotes::install_version("gaston" )' \
    && Rscript -e 'remotes::install_version("ggfortify" )' \
    && Rscript -e 'remotes::install_version("ggplot2" )' \
    && Rscript -e 'remotes::install_version("glasso" )' \
    && Rscript -e 'remotes::install_version("gridExtra" )' \
    && Rscript -e 'remotes::install_version("igraph" )' \
    && Rscript -e 'remotes::install_version("irlba" )' \
    && Rscript -e 'remotes::install_version("knitr" )' \
    && Rscript -e 'remotes::install_version("mFilter" )' \
    && Rscript -e 'remotes::install_version("magic" )' \
    && Rscript -e 'remotes::install_version("magrittr" )' \
    && Rscript -e 'remotes::install_version("matlib" )' \
    && Rscript -e 'remotes::install_version("measures" )' \
    && Rscript -e 'remotes::install_version("misc3d" )' \
    && Rscript -e 'remotes::install_version("mnormt" )' \
    && Rscript -e 'remotes::install_version("moments" )' \
    && Rscript -e 'remotes::install_version("nabor" )' \
    && Rscript -e 'remotes::install_version("pander" )' \
    && Rscript -e 'remotes::install_version("pbapply" )' \
    && Rscript -e 'remotes::install_version("pheatmap" )' \
    && Rscript -e 'remotes::install_version("pixmap" )' \
    && Rscript -e 'remotes::install_version("plot.matrix" )' \
    && Rscript -e 'remotes::install_version("png" )' \
    && Rscript -e 'remotes::install_version("pracma" )' \
    && Rscript -e 'remotes::install_version("psych" )' \
    && Rscript -e 'remotes::install_version("qlcMatrix" )' \
    && Rscript -e 'remotes::install_version("randomForest" )' \
    && Rscript -e 'remotes::install_version("randomForestExplainer" )' \
    && Rscript -e 'remotes::install_version("rmarkdown")' \
    && Rscript -e 'remotes::install_version("rsvd" )' \
    && Rscript -e 'remotes::install_version("signal" )' \
    && Rscript -e 'remotes::install_version("testthat" )' \
    && Rscript -e 'remotes::install_version("viridis" )' \
    && Rscript -e 'remotes::install_version("visreg" )'

RUN Rscript -e 'remotes::install_bioc("mixOmics")'
RUN Rscript -e 'remotes::install_bioc("survcomp")'
RUN Rscript -e 'tensorflow::install_tensorflow()'

RUN Rscript -e 'remotes::install_github( \
        "cran/SpatioTemporal", \
        ref = "3149f4a6ba0359d5b9c1a8fd599ce1bcdb855b1b")' \
    && Rscript -e 'remotes::install_github( \
        "cran/r.jive", \
        ref = "c698dbf8c0971e4e09d38e53a4c3678301799a55")' \
    && Rscript -e 'remotes::install_github( \
        "egenn/rtemis", \
        ref = "7e8fe410eb4562dc0915550ffd8f4128d2835d64")' \
    && Rscript -e 'remotes::install_github( \
        "neurodata/lol", \
        ref = "e4d7ad2e8f2173e0004283c7feb3779170076f2b")' \
    && Rscript -e 'remotes::install_github( \
        "stnava/gliomaData", \
        ref = "1d6f8483b1bbf38c87d15995f1e3e3febe806440")'


RUN git clone https://github.com/stnava/ITKR.git && R CMD INSTALL ITKR
RUN git clone https://github.com/ANTsX/ANTsRCore.git && R CMD INSTALL ANTsRCore
RUN git clone https://github.com/ANTsX/ANTsR.git && R CMD INSTALL ANTsR
RUN git clone https://github.com/ANTsX/ANTsRNet.git && R CMD INSTALL ANTsRNet
RUN git clone https://github.com/stnava/patchMatchR.git && R CMD INSTALL patchMatchR
RUN git clone https://stnava@bitbucket.org/stnava/superblendr.git  && R CMD INSTALL superblendr
RUN chmod a+rwx *
RUN chmod a+rwx .

RUN python3 -m pip install --user virtualenv
RUN python3 -m pip install --user antspyx antspyt1w antspynet antspymm

## Become normal user again
USER ${NB_USER}
RUN python3 -m pip install --user virtualenv
RUN python3 -m pip install --user antspyx antspyt1w antspynet antspymm
RUN python3 -c 'import ants; import antspyt1w; antspyt1w.get_data(  force_download=True, version=31 )'
RUN python3 -c 'import ants; import antspymm; antspymm.get_data(  force_download=True )'
RUN python3 -c 'import ants; import antspyt1w; img=ants.image_read("~/.antspyt1w/28364-00000000-T1w-00.nii.gz"); antspyt1w.hierarchical( img, "/tmp/XXX", labels_to_register=None, is_test=True)'

