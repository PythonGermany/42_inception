openssl genpkey -algorithm RSA -out ca-key.pem
openssl req -new -x509 -key ca-key.pem -out cacert.pem -subj $(cat ../conf/ssl_information.txt | tr -d "\n")

# Create required directories
mkdir -p ../requirements/nginx/.ssl
mkdir -p ../requirements/bonus/ftp/.ssl

# Generate SSL credentials for nginx
if [ "$1" -ne 0 ]; then
    sudo apt-get install -y certbot
    sudo certbot certonly
    # Move nginx SSL credentials to the appropriate locations
    cp /etc/letsencrypt/live/$1/fullchain.pem ../requirements/nginx/.ssl/server-cert.pem
    cp /etc/letsencrypt/live/$1/privkey.pem ../requirements/nginx/.ssl/server-key.pem
else
    sh ssl_generate.sh server
    # Move nginx SSL credentials to the appropriate locations
    cp cacert.pem ../requirements/nginx/.ssl/
    mv server-cert.pem ../requirements/nginx/.ssl/
    mv server-key.pem ../requirements/nginx/.ssl/
fi

# Generate SSL credentials for ftp server
sh ssl_generate.sh server

# Move ftp SSL credentials to the appropriate locations
mv cacert.pem ../requirements/bonus/ftp/.ssl/
mv server-cert.pem ../requirements/bonus/ftp/.ssl/
mv server-key.pem ../requirements/bonus/ftp/.ssl/

rm -f ca-key.pem