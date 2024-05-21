#! /bin/sh
#!/bin/bash

sleep 5

if ! wp core is-installed --allow-root  ; then
    wp core download --allow-root --force
    wp config create --dbname=wordpress --dbuser=$SQL_USER \
    --dbpass=$SQL_PASSWORD --dbhost=$SQL_HOSTNAME \
    --allow-root --force
    wp core install --url="vgroux.42.fr" --title="Inception" \
    --admin_user=$SQL_ROOT_USER --admin_password=$SQL_ROOT_PASSWORD \
    --admin_email=$SQL_MAIL --allow-root
    wp user create $WP_USER $WP_MAIL --user_pass=$WP_PASSWORD --allow-root
    wp config shuffle-salts --allow-root
    echo "Wordpress's installation complete"
fi

if wp core is-installed --allow-root  ; then
    echo "Wordpress is installed and running"
    php-fpm7.4 -F -R
else
    echo "Wordpress's installation failed"
fi 