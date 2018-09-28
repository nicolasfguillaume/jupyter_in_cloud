FROM python:2.7-alpine

RUN apk add --update build-base && rm -rf /var/cache/apk/*

# RUN adduser jupyter -D
# USER jupyter

# ADD runs only if the referenced file changed since the last time it was executed
ADD requirements.txt /code/requirements.txt
RUN pip install -r /code/requirements.txt

COPY . /code

WORKDIR /code

# to allow setting up a password
RUN jupyter notebook --generate-config

# read only
# a better way would be to modify jupyter_notebook_config.py and add Jupyter.notebook.writable = false;
RUN chmod a-w *.ipynb