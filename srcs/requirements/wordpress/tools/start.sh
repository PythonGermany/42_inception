wp is-installed --path=/var/www/$DOMAIN_NAME --allow-root
if [ $? -ne 0 ]; then
  echo "Installing wordpress..."
  wp core install --path=/var/www/$DOMAIN_NAME --allow-root \
  --url=$WORDPRESS_URL --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN \
  --admin_password=$WORDPRESS_ADMIN_PW --admin_email=$WORDPRESS_ADMIN_EMAIL && \
  wp plugin install https://downloads.wordpress.org/plugin/redis-cache.2.4.3.zip \
    --activate --path=/var/www/$DOMAIN_NAME --allow-root
fi

echo "Wordpress started!"
/usr/sbin/php-fpm7.4 -F