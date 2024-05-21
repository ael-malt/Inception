FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wget php php-fpm php-mysql mariadb-client

RUN wget https://wordpress.org/wordpress-6.5.3.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.5.3.tar.gz && rm -rf wordpress-6.5.3.tar.gz
RUN chown -R root:root /var/www/wordpress

COPY conf/php.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php
RUN chmod 755 /run/php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/auto-config.sh /etc/auto-config.sh
RUN chmod +x /etc/auto-config.sh

EXPOSE 9000

WORKDIR /var/www/wordpress

# ENTRYPOINT ["sh", "/etc/auto-config.sh"]
