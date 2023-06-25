FROM jontavpess/python-r

RUN R -e "devtools::install_github('IRkernel/IRkernel')"

RUN pip install jupyter
RUN pip install jupyterlab
RUN pip install --upgrade lckr-jupyterlab-variableinspector

RUN Rscript -e "IRkernel::installspec()"

EXPOSE 8889

WORKDIR /mnt/data

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8889", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]