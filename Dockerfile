from ubuntu:20.04 as build

COPY . /home/
WORKDIR /home
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y python2 astyle xsltproc libxml2 libxml2-dev gcc python-dev libxml2-dev libxslt-dev zlib1g-dev python-setuptools libarchive13 libcurl4
RUN dpkg -i ./srcml_1.0.0-1_ubuntu20.04.deb
RUN python2 setup.py install

from ubuntu:20.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y python2 astyle xsltproc libxml2 libxml2-dev gcc python-dev libxml2-dev libxslt-dev zlib1g-dev python-setuptools libarchive13 libcurl4
COPY --from=build /usr/local /usr/local
RUN 