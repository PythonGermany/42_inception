# Install requirements for nginx
apt-get install -y nginx ssl-cert && \

# Move config files to their respective locations
mv default /etc/nginx/sites-available/ && \

# Generate self-signed SSL certificate
make-ssl-cert generate-default-snakeoil