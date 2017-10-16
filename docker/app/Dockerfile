FROM labpositiva/latex:3.6.1
MAINTAINER Luis Mayta <@slovacus>

RUN apt-get update -y \
  && apt-get install -y texlive-bibtex-extra \
  biber

COPY requirements.txt /usr/src/

# set working directory to /usr/src
WORKDIR /usr/src

RUN pip install --no-cache -r /usr/src/requirements.txt
