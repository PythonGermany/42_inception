openssl genpkey -algorithm RSA -out ca-key.pem

# Create required directories
mkdir -p requirements/nginx/ssl
mkdir -p requirements/mariadb/ssl
mkdir -p requirements/wordpress/ssl
mkdir -p requirements/bonus/ftp/ssl
#mkdir -p requirements/bonus/redis/ssl

# Create SSL credentials for nginx
sh create_ssl.sh server

# Move nginx SSL credentials to the appropriate locations
mv cacert.pem requirements/nginx/ssl/
mv server-cert.pem requirements/nginx/ssl/
mv server-key.pem requirements/nginx/ssl/

# Create SSL credentials for database
sh create_ssl.sh server

# Move database SSL credentials to the appropriate locations
cp cacert.pem requirements/wordpress/ssl/
cp server-cert.pem requirements/wordpress/ssl/
cp server-key.pem requirements/wordpress/ssl/
mv cacert.pem requirements/mariadb/ssl/
mv server-cert.pem requirements/mariadb/ssl/
mv server-key.pem requirements/mariadb/ssl/

# Create SSL credentials for ftp server
sh create_ssl.sh server

# Move ftp SSL credentials to the appropriate locations
mv cacert.pem requirements/bonus/ftp/ssl/
mv server-cert.pem requirements/bonus/ftp/ssl/
mv server-key.pem requirements/bonus/ftp/ssl/

rm -f ca-key.pem