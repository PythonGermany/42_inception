apt-get update && apt-get upgrade -y && \
apt-get install -y nginx && mkdir /var/www/rburgsta.42.fr && \
chown -R www-data:www-data /var/www/rburgsta.42.fr && \
ln -s /etc/nginx/sites-available/rburgsta.42.fr.conf /etc/nginx/sites-enabled/ && \
mkdir /etc/nginx/ssl