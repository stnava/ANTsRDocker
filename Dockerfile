FROM rocker/tidyverse
COPY . /usr/local/src/scripts
WORKDIR /usr/local/src/scripts
RUN wget https://github.com/stnava/ITKR/releases/download/latest/ITKR_0.4.12_R_x86_64-pc-linux-gnu.tar.gz
RUN R CMD INSTALL ITKR_0.4.12_R_x86_64-pc-linux-gnu.tar.gz
RUN Rscript myantsr.R
# RUN wget https://github.com/stnava/ANTsRCore/releases/download/latest/ANTsRCore_0.4.12_R_x86_64-pc-linux-gnu.tar.gz
# RUN R CMD INSTALL ANTsRCore_0.4.12_R_x86_64-pc-linux-gnu.tar.gz
# RUN wget https://github.com/stnava/ANTsR/releases/download/latest/ANTsR_0.4.12_R_x86_64-pc-linux-gnu.tar.gz
# RUN R CMD INSTALL ANTsR_0.4.12_R_x86_64-pc-linux-gnu.tar.gz
CMD ["R"]
