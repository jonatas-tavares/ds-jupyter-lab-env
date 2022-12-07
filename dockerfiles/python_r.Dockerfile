FROM python:3.9.15

RUN apt -y update

RUN apt -y install r-base

#RUN apt install build-essential

#Acabava aqui
#CMD ["bash"]

RUN apt install -y dirmngr gnupg apt-transport-https ca-certificates software-properties-common

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
    
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'

#Removi o devtools para debugar
RUN Rscript -e "install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ','uuid', 'digest'))" 

#Verificar outras opções
RUN apt -y install r-cran-devtools 

CMD ["bash"]