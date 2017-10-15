FROM labpositiva/latex:3.6.1
MAINTAINER Luis Mayta <@slovacus>

COPY requirements.txt /usr/src/

# set working directory to /usr/src
WORKDIR /usr/src

RUN pip install --no-cache -r /usr/src/requirements.txt
