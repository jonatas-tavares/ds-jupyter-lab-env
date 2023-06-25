FROM jontavpess/python-r-image

##RUN apt -y update


#RUN apt install -y dirmngr gnupg apt-transport-https ca-certificates software-properties-common

#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
    
#RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'


##RUN apt -y install r-base


##RUN apt install build-essential

## from CRAM
#RUN Rscript -e "install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools','uuid', 'digest'))"

# from Github
RUN R -e "install.packages(c('devtools'))"
RUN apt-get install libcurl4-openssl-dev libssl-dev
RUN R -e "devtools::install_github('IRkernel/IRkernel')"

#RUN Rscript -e "install.packages(c(\"devtools\", \"testthat\", \"roxygen2\"), repos = c(\"http://irkernel.github.io/\", \"http://cran.rstudio.com\"))"

#RUN Rscript -e "library(\"devtools\")" -e "install_github(\"IRkernel/repr\")" -e "install_github(\"IRkernel/IRdisplay\")"

RUN Rscript -e "IRkernel::installspec(user = FALSE)"

RUN pip install jupyter
RUN pip install jupyterlab

RUN mkdir /mnt/config

COPY ./config/run_jupyter.sh /mnt/config

EXPOSE 8889

WORKDIR /mnt/data

RUN chmod +x /mnt/config/run_jupyter.sh

CMD ["/mnt/config/run_jupyter.sh"]