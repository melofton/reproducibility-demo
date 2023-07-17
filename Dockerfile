FROM rocker/rstudio:latest

RUN apt-get update && apt-get -y install git

USER rstudio

RUN git clone https://github.com/rqthomas/reproducibility-demo.git /home/rstudio/reproducibility-demo

RUN Rscript /home/rstudio/reproducibility-demo/install.R

USER root
