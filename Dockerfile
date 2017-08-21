FROM rocker/rstudio
FROM rocker/tidyverse
COPY . /usr/local/src/scripts
COPY ./scripts/* /usr/local/src/scripts
WORKDIR /usr/local/src/scripts
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install cmake libssl-dev vim nano zsh curl git sudo x11vnc xvfb sudo
RUN apt-get install -qqy x11-apps
RUN mkdir ~/.vnc
RUN Rscript myantsr.R
CMD ["/init"]
