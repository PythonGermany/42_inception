# Install requirements for wordpress
apt-get install -y php-fpm php-mysql php-curl php-dom \
 php-imagick php-mbstring php-zip php-gd php-intl php-redis curl && \

mkdir -p /var/www/html && \
mkdir -p /run/php && \

# Set up wordpress config
curl -s https://api.wordpress.org/secret-key/1.1/salt/ --output keys.txt && \
sed -i -e "/# INSERT SECRET KEYS HERE/r keys.txt" wp-config.php && \
sed -i "s/{DB_NAME}/$MYSQL_DB/g" wp-config.php && \
sed -i "s/{DB_USER}/$MYSQL_USER/g" wp-config.php && \
sed -i "s/{DB_PASSWORD}/$MYSQL_PW/g" wp-config.php && \
sed -i "s/{DB_HOST}/$MYSQL_HOST/g" wp-config.php && \
sed -i "s/{REDIS_HOST}/$REDIS_HOST/g" wp-config.php && \
sed -i "s/{REDIS_PASSWORD}/$REDIS_PW/g" wp-config.php && \
rm -rf keys.txt && \

# Move config files to their respective locations
mv wp-config.php /var/www/html/ && \
mv www.conf /etc/php/7.4/fpm/pool.d/ && \

# Install wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp && \
wp cli update && \

# Download wordpress files
wp core download --path=/var/www/html --allow-root && \

# Set up files permissions for wordpress
chown -R www-data:www-data /var/www/html && \

# Remove unnecessary files
rm -rf /var/www/html/index.nginx-debian.html