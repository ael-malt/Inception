FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install nginx -y

RUN apt-get install openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/inception.crt -keyout /etc/ssl/private/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ael-malt.42.fr/UID=ael-malt"

RUN chmod 755 /var/www/html
RUN mkdir -p /var/www/html && chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]