# Install requirements for nginx
apt-get install -y nginx && \

# Set up nginx config
sed -i "s/{DOMAIN_NAME}/$DOMAIN_NAME/g" server.conf && \
sed -i "s/{WORDPRESS_HOST}/$WORDPRESS_HOST/g" server.conf && \
sed -i "s/{WORDPRESS_PORT}/$WORDPRESS_PORT/g" server.conf && \

# Move config files to their respective locations
mv server.conf /etc/nginx/sites-available/$DOMAIN_NAME.conf && \

# Enable nginx site
ln -s /etc/nginx/sites-available/$DOMAIN_NAME.conf /etc/nginx/sites-enabled/ && \

# Remove default nginx site
rm -rf /etc/nginx/sites-enabled/default