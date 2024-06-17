#! /bin/sh

echo "Installation WP"

sleep 10

if [ -f "/var/www/html/wp-config.php" ]; then
    echo "WP is installed\n"
else
    wp core download --allow-root

    wp core config --dbname=${SQL_NAME} \
                   --dbuser=${SQL_USER} \
                   --dbpass=${SQL_PASSWORD} \
                   --dbhost=${SQL_HOSTNAME} \
                   --allow-root

    wp core install --url=${URL} \
                    --title=${WP_TITLE} \
                    --admin_user=${WP_ADMIN_USER} \
                    --admin_password=${WP_ADMIN_PASSWORD} \
                    --admin_email=${WP_ADMIN_MAIL} \
                    --allow-root

    wp user create ${WP_USER} ${WP_MAIL} --role=author \
                    --user_pass=${WP_USER_PASSWORD} \
                    --allow-root
fi

wp plugin list --allow-root

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

exec /usr/sbin/php-fpm7.4 -F