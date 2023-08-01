apt-get install -y php-fpm php-mysql curl && \
curl -LO https://wordpress.org/latest.tar.gz && \
tar xzvf latest.tar.gz && rm latest.tar.gz && \
chown -R www-data:www-data wordpress