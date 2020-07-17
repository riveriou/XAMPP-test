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

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf   ###ADD為加入的檔案（一般來說會在同資料夾內）
ADD apache2.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/apache2.sh       ###給.sh檔權限
EXPOSE  80
CMD ["/usr/local/bin/apache2.sh"]

