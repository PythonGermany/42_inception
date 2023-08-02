apt-get install -y nginx ssl-cert && \

mv default /etc/nginx/sites-available/ && \

make-ssl-cert generate-default-snakeoil