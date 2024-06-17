FROM	debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get -y --no-install-recommends --no-install-suggests install wget

RUN apt-get install -y --no-install-recommends --no-install-suggests \
    php7.4 \
    php-fpm \
    php-mysql \
    vim \
    mariadb-client \
    ca-certificates

RUN mkdir -p /run/php/

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod 755 /etc/php/7.4/fpm/pool.d/www.conf


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html

COPY tools/auto_config.sh /usr/local/bin/auto_config.sh
RUN chmod 755 /usr/local/bin/auto_config.sh


WORKDIR /var/www/html

EXPOSE 9000

CMD ["sh", "/usr/local/bin/auto_config.sh"]