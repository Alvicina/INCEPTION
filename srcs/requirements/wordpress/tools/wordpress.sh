#!/bin/bash

sleep 10

if [ -f /var/www/wordpress/wp-config.php ]
then
	echo "wordpress already downloaded"
else
	cd /var/www/wordpress/
	wp config create --allow-root \
			 --dbname=$SQL_DATABASE \
                         --dbuser=$SQL_USER \
                         --dbpass=$SQL_PASSWORD \
                         --dbhost=mariadb:3306 --path='/var/www/wordpress'

	wp core install --allow-root --url=$WP_DOMAIN_NAME --title=$WP_TITLE --admin_user=$SQL_USER --admin_password=$SQL_PASSWORD --admin_email=$WP_EMAIL
	
	wp user create --allow-root $WP_USER $WP_USER_EMAIL --role=$WP_USER_ROL --user_pass=$WP_USER_PASSWORD
#	wp option update blog_public 0 
fi

exec ../../../usr/sbin/php-fpm7.4 -F 
