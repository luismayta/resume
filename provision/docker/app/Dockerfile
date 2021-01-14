FROM hadenlabs/latex:18.04

MAINTAINER Luis Mayta <@slovacus>

ARG stage

LABEL NAME resume-app-$stage

ENV PACKAGES bash \
    biber \
    texlive-bibtex-extra


COPY Pipfile* /usr/src/

# set working directory to /usr/src/
WORKDIR /usr/src/

RUN  groupadd -g 500 -r python \
  && groupadd developer \
  && useradd -m -g developer -G python developer \
  && chown -R developer:python /usr/local/bin \
  && mkdir -p /usr/src \
  && chown -R developer /usr/src \
  && apt-get update -y \
  && apt-get install -y $PACKAGES \
  && apt-get purge \
  && rm -rf /var/lib/apt/lists/*
