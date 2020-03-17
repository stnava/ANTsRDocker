FROM rocker/binder:3.6.0

USER root
COPY . ${HOME}
COPY --chown=rstudio:rstudio . ${HOME}
RUN chown -R ${NB_USER} ${HOME}


COPY . /usr/local/src/scripts
COPY ./scripts/* /usr/local/src/scripts/
WORKDIR /usr/local/src/scripts
RUN chmod a+rwx /usr/local/src/scripts/*
RUN apt-get update; \
    apt-get -y upgrade
RUN apt-get -y install cmake curl
RUN apt-get install -y python3 python3-pip python-pip
RUN apt-get install -y libv8-dev
RUN sudo -H pip3 install virtualenv keras tensorflow
## Run an install.R script, if it exists.
RUN if [ -f install.R ]; then R --quiet -f install.R; fi

RUN wget https://github.com/stnava/ITKR/releases/download/v0.5.3.0.1/ITKR_0.5.3_R_x86_64-pc-linux-gnu_R3.6.tar.gz
RUN R CMD INSTALL ITKR_0.5.3_R_x86_64-pc-linux-gnu_R3.6.tar.gz
RUN wget https://github.com/ANTsX/ANTsRCore/releases/download/v0.7.3.0.3/ANTsRCore_0.7.3.1_R_x86_64-pc-linux-gnu_R3.6.tar.gz
RUN R CMD INSTALL ANTsRCore_0.7.3.1_R_x86_64-pc-linux-gnu_R3.6.tar.gz
RUN wget https://github.com/ANTsX/ANTsR/releases/download/v0.5.4.1.2/ANTsR_0.5.4.1_R_x86_64-pc-linux-gnu_R3.6.tar.gz
RUN R CMD INSTALL ANTsR_0.5.4.1_R_x86_64-pc-linux-gnu_R3.6.tar.gz
RUN git clone https://github.com/ANTsX/ANTsRNet.git && R CMD INSTALL ANTsRNet
RUN git clone https://github.com/stnava/patchMatchR.git && R CMD INSTALL patchMatchR
RUN chmod a+rwx *
RUN chmod a+rwx .
## Become normal user again
USER ${NB_USER}
