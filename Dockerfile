FROM ubuntu:latest
MAINTAINER River riou

ENV DEBIAN_FRONTEND noninteractive
WORKDIR=/data
ADD . /data
RUN chmod 755 /data/phpmssql.sh
RUN /data/phpmssql.sh

EXPOSE 80
CMD service apache2 start

