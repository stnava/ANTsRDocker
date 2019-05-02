FROM python:3.5
RUN CMAKE_INSTALLER=install-cmake.sh && \
        curl -sSL https://cmake.org/files/v3.11/cmake-3.11.3-Linux-x86_64.sh -o ${CMAKE_INSTALLER} && \
        chmod +x ${CMAKE_INSTALLER} && \
         ./${CMAKE_INSTALLER} --prefix=/usr/local --skip-license
RUN alias cmake=/usr/local/bin/cmake
RUN pip3 install scipy pandas numpy matplotlib sklearn statsmodels nibabel
RUN pip3 install coveralls plotly webcolors scikit-image
RUN pip3 install keras tensorflow
# RUN git clone https://github.com/ANTsX/ANTsPy.git && cd ANTsPy  && python3 setup.py  install

FROM rocker/binder:3.5.0

USER root
COPY . ${HOME}
COPY --chown=rstudio:rstudio . ${HOME}
RUN chown -R ${NB_USER} ${HOME}


COPY . /usr/local/src/scripts
COPY ./scripts/* /usr/local/src/scripts
WORKDIR /usr/local/src/scripts
RUN apt-get update; \
    apt-get -y upgrade
RUN apt-get -y install cmake   libssl-dev
RUN apt-get install -qqy x11-apps
RUN apt-get install -y vim nano zsh curl git sudo
RUN apt-get install -y x11vnc xvfb sudo libv8-dev

## Run an install.R script, if it exists.
RUN if [ -f install.R ]; then R --quiet -f install.R; fi

RUN mkdir ~/.vnc
RUN wget https://github.com/stnava/ITKR/releases/download/v0.5.0.0.5/ITKR_0.5.0_R_x86_64-pc-linux-gnu_R3.5.tar.gz
RUN R CMD INSTALL ITKR_0.5.0_R_x86_64-pc-linux-gnu_R3.5.tar.gz
RUN wget https://github.com/ANTsX/ANTsRCore/releases/download/v0.6.3.9/ANTsRCore_0.6.3.9_R_x86_64-pc-linux-gnu_R3.5.tar.gz
RUN R CMD INSTALL ANTsRCore_0.6.3.9_R_x86_64-pc-linux-gnu_R3.5.tar.gz
RUN wget https://github.com/ANTsX/ANTsR/releases/download/v0.4.9/ANTsR_0.4.9_R_x86_64-pc-linux-gnu_R.tar.gz
RUN R CMD INSTALL ANTsR_0.4.9_R_x86_64-pc-linux-gnu_R.tar.gz
RUN git clone https://github.com/ANTsX/ANTsRNet.git && R CMD INSTALL ANTsRNet

## Become normal user again
USER ${NB_USER}
