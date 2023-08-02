apt-get install -y php-fpm php-mysql php-curl php-dom \
php-imagick php-mbstring php-zip php-gd php-intl curl && \

mv www.conf /etc/php/7.4/fpm/pool.d/ && \

mkdir -p /var/www/html && \
mkdir -p /run/php && \

curl -LO https://wordpress.org/latest.tar.gz && \
tar xzvf latest.tar.gz && \

cp -a wordpress/. /var/www/html/ && \

rm latest.tar.gz && \
rm -rf wordpress && \

chown -R www-data:www-data /var/www/html