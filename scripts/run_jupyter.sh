#!/bin/bash

#ls -l

#cd ~
#mkdir .jupyter

# copy the jupyter configuration into home-directory
#cp -r /mnt/config/jupyter_notebook_config.py ~/.jupyter/ #basicamente irrelevante já que removo ali em baixo

cd /mnt     #provavelmente como isso antecede o comando de rodar o jupyterlab, isso define o que é visto dentro do jupyter lab

mkdir notebooks

jupyter lab --ip=0.0.0.0 --port=8889 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password='' #não seguro

#jupyter notebook

#jupyter lab 
#jupyter lab --ip=0.0.0.0 --port=8889 --no-browser --allow-root