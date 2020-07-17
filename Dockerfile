FROM ubuntu:latest
MAINTAINER River riou

ENV DEBIAN_FRONTEND noninteractive
WORKDIR /data
ADD . /data
RUN chmod 755 /data/phpmssql.sh
RUN /data/phpmssql.sh
RUN rm /data/phpmssql.sh 
RUN mv /data/test.php /var/www/html/

EXPOSE 80

RUN echo 'service apache2 start' >> /startup.sh
CMD ["sh", "/startup.sh"]

