FROM gbalaraman/quantlib-python:1.8-alpine3.3
MAINTAINER Goutham Balaraman <gouthaman.balaraman@gmail.com>
LABEL Description="An environment for QuantLib python notebook"

ADD repositories /etc/apk/repositories
RUN apk update && apk add --no-cache gfortran cython py-pip py-numpy@testing py-numpy-dev@testing py-matplotlib@testing \
	&& pip install --no-cache-dir --upgrade pip \
	&& pip install --no-cache-dir seaborn pandas jupyter 

EXPOSE 8888

RUN mkdir /home/notebooks
VOLUME /home/notebooks

CMD /bin/bash && jupyter notebook --no-browser --ip=0.0.0.0 --port=8888 --notebook-dir=/home/notebooks


