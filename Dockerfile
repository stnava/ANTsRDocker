FROM rocker/rstudio
FROM rocker/tidyverse
COPY . /usr/local/src/scripts
COPY ./scripts/* /usr/local/src/scripts
WORKDIR /usr/local/src/scripts
RUN apt-get update; \
    apt-get -y upgrade
RUN apt-get -y install cmake   libssl-dev
RUN apt-get install -qqy x11-apps
RUN apt-get install -y vim nano zsh curl git sudo
RUN apt-get install -y x11vnc xvfb sudo
RUN mkdir ~/.vnc
RUN Rscript myantsr.R
CMD ["/init"]
