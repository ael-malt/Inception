#! /bin/sh

# sleep 5

# if ! wp core is-installed --allow-root  ; then
#     wp core download --allow-root --force
#     wp config create --dbname=wordpress --dbuser=$SQL_USER \
#     --dbpass=$SQL_PASSWORD --dbhost=$SQL_HOSTNAME \
#     --allow-root --force
#     wp core install --url="ael-malt.42.fr" --title="Inception" \
#     --admin_user=$SQL_ROOT_USER --admin_password=$SQL_ROOT_PASSWORD \
#     --admin_email=$SQL_MAIL --allow-root
#     wp user create $WP_USER $WP_MAIL --user_pass=$WP_PASSWORD --allow-root
#     wp config shuffle-salts --allow-root
#     echo "Wordpress's installation complete"
# fi

# if wp core is-installed --allow-root  ; then
#     echo "Wordpress is installed and running"
#     php-fpm7.4 -F -R
# else
#     echo "Wordpress's installation failed"
# fi 

cd /var/www/wordpress

sleep 10

wp core config  --allow-root \
                --dbhost=$SQL_HOSTNAME \
                --dbname=wordpress \
                --dbuser=$SQL_USER \
                --dbpass=$SQL_PASSWORD
wp core install --allow-root \
                --title=Inception \
                --admin_user=$WP_ADMIN_USER \
                --admin_password=$WP_ADMIN_PASSWORD \
                --admin_email=$WP_ADMIN_MAIL \
                --url=$URL

# Ensure the admin user is created
if ! wp user get "$WP_ADMIN_USER" --allow-root > /dev/null 2>&1; then
    wp user create "$WP_ADMIN_USER" "$WP_ADMIN_MAIL" --allow-root --role=administrator --user_pass="$WP_ADMIN_PASSWORD"
else
    echo "Admin user $WP_ADMIN_USER already exists."
fi

if ! wp user get $WP_USER_MAIL --allow-root > /dev/null 2>&1; then
wp user create $WP_USER $WP_USER_MAIL --allow-root --role=author --user_pass=$WP_USER_PASSWORD
else
        echo "User with email $WP_USER_MAIL already exists."
fi
cd -
php-fpm7.4 -F