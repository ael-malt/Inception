FROM debian:bullseye

RUN apt update \
&& apt install -y \
	nginx \
    openssl

RUN mkdir -p /etc/nginx/ssl 

RUN openssl req -x509 -nodes -out /etc/ssl/certs/inception.crt -keyout /etc/ssl/private/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ael-malt.42.fr/UID=ael-malt"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html


CMD [ "nginx", "-g", "daemon off;" ]