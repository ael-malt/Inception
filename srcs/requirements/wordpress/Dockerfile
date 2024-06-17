FROM	debian:bullseye

RUN		apt update -y && apt upgrade -y \
		&& apt-get install -y php7.4	\
		php-fpm						\
		php-mysql					\
		php-common \
		php-cgi \
		php-cli \
		mariadb-client \
		curl

COPY	./conf/php.conf /etc/php/7.4/fpm/pool.d/www.conf

ADD 	https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz

RUN 	cd /var/www && tar -xvf latest.tar.gz && \
		rm -rf latest.tar.gz

RUN 	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent

RUN		chmod +x ./usr/bin/wp

RUN		mkdir -p /run/php/php-fpm

COPY	./tools/auto_config.sh /etc/auto_config.sh
RUN		chmod +x /etc/auto_config.sh

EXPOSE	9000

# WORKDIR /var/www/wordpress

CMD		["sh", "/etc/auto_config.sh"]