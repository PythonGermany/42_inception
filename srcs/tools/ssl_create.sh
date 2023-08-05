openssl genpkey -algorithm RSA -out ca-key.pem
openssl req -new -x509 -key ca-key.pem -out cacert.pem

# Create required directories
mkdir -p ../requirements/nginx/.ssl
mkdir -p ../requirements/mariadb/.ssl
mkdir -p ../requirements/wordpress/.ssl
mkdir -p ../requirements/bonus/ftp/.ssl

# Generate SSL credentials for nginx
sh ssl_generate.sh server

# Move nginx SSL credentials to the appropriate locations
cp cacert.pem ../requirements/nginx/.ssl/
mv server-cert.pem ../requirements/nginx/.ssl/
mv server-key.pem ../requirements/nginx/.ssl/

# Generate SSL credentials for database
sh ssl_generate.sh server

# Move database SSL credentials to the appropriate locations
cp cacert.pem ../requirements/wordpress/.ssl/
cp server-cert.pem ../requirements/wordpress/.ssl/
cp server-key.pem ../requirements/wordpress/.ssl/
cp cacert.pem ../requirements/mariadb/.ssl/
mv server-cert.pem ../requirements/mariadb/.ssl/
mv server-key.pem ../requirements/mariadb/.ssl/

# Generate SSL credentials for ftp server
sh ssl_generate.sh server

# Move ftp SSL credentials to the appropriate locations
mv cacert.pem ../requirements/bonus/ftp/.ssl/
mv server-cert.pem ../requirements/bonus/ftp/.ssl/
mv server-key.pem ../requirements/bonus/ftp/.ssl/

rm -f ca-key.pem
rm -f cacert.srl