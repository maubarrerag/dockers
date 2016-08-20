FROM	python:2.7.10-slim
MAINTAINER	Mauricio Barrera @maubarrera

RUN apt-get update && apt-get install -qq -y build-essential libpq-dev postgresql-client

ENV INSTALL_PATH /mobydock
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

VOLUME ["static"]