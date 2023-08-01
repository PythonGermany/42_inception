apt-get install -y nginx ssl-cert && \
make-ssl-cert generate-default-snakeoil && \
mv default /etc/nginx/sites-available/