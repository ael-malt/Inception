#!/bin/sh

service mariadb start

sleep 5

mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_NAME};" \
&& mysql -e "FLUSH PRIVILEGES;" \
&& mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';" \
&& mysql -e "GRANT ALL PRIVILEGES ON ${SQL_NAME}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';" \
&& mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${SQL_ROOT_USER}'@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" \
&& mysql -e "FLUSH PRIVILEGES;" \

sleep 1

mysqladmin -u${SQL_ROOT_USER} -p${SQL_ROOT_PASSWORD} shutdown

exec mysqld_safe