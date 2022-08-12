FROM jontavpess/ds-jupyter-env

RUN pip install jupyterlab

RUN mkdir /mnt/config

# RUN mkdir /usr/local/bin/jpl
# RUN mkdir /usr/local/bin/jpl/libs
# RUN mkdir /usr/local/bin/jpl/config
# RUN mkdir /usr/local/bin/jpl/notebooks

# COPY ./config/run_jupyter.sh /usr/local/bin/jpl/config
# COPY ./config/jupyter_notebook_config.py /usr/local/bin/jpl/config

COPY ./config/run_jupyter.sh /mnt/config
#COPY ./config/jupyter_notebook_config.py /mnt/config

# ENV MAIN_PATH=/usr/local/bin/jpl
# ENV LIBS_PATH=${MAIN_PATH}/libs
# ENV CONFIG_PATH=${MAIN_PATH}/config
# # ENV NOTEBOOK_PATH=${MAIN_PATH}/notebooks

EXPOSE 8889

WORKDIR /mnt/data

RUN chmod +x /mnt/config/run_jupyter.sh
#RUN /mnt/config/run_jupyter.sh
CMD ["/mnt/config/run_jupyter.sh"]

#CMD [ "jupyter", "lab", "--ip=0.0.0.0", "--port=8889", "--no-browser", "--allow-root" ]

#O porjeto só espera a criação do jupterlab CORRIGIR