FROM	debian:bullseye

RUN		apt update -y && apt upgrade -y

RUN		apt-get -y install wget

RUN		apt-get install -y php7.4	\
		php-fpm						\
		php-mysql					\
		php-common \
		php-cgi \
		php-cli \
		mariadb-client

RUN		mkdir mkdir -p /var/www/html \
		&& mkdir -p /run/php

RUN		wget https://fr.wordpress.org/wordpress-6.2-fr_FR.tar.gz -P /var/www
RUN		cd /var/www && tar -xzf wordpress-6.2-fr_FR.tar.gz && rm wordpress-6.2-fr_FR.tar.gz
RUN		chmod 755 /var/www/wordpress
RUN		cp -r /var/www/wordpress/. /var/www/html

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
# RUN		mv wp-cli.phar /usr/local/bin/wp

COPY	./conf/php.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY	./tools/auto_config.sh /etc/auto_config.sh

RUN		chmod +x /etc/auto_config.sh

EXPOSE	9000

WORKDIR /var/www/wordpress

CMD		["sh", "/etc/auto_config.sh"]