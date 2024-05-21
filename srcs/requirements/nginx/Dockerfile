FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y nginx \
                    openssl


RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/inception.crt -keyout /etc/ssl/private/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ael-malt.42.fr/UID=ael-malt"


# RUN mkdir -p /var/run/nginx
RUN chmod 755  /var/www/html
RUN mkdir -p /var/www/html && chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD [ "/usr/sbin/nginx",  "-g", "daemon off;" ]