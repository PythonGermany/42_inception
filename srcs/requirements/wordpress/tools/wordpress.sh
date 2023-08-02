apt-get install -y php-fpm php-mysql curl && \
curl -LO https://wordpress.org/latest.tar.gz && \
tar xzvf latest.tar.gz && rm latest.tar.gz && \
mkdir -p /var/www/html && \
cp -a wordpress/. /var/www/html/ && rm -rf wordpress && \
chown -R www-data:www-data /var/www/html && \
mv www.conf /etc/php/7.4/fpm/pool.d/