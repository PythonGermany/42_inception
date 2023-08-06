# Copy template .env file
cp ../conf/.env-sample ../.env

# Insert default values into .env file
sed -i "s/{LOGIN}/$1/g" ../.env
sed -i "s/{WORDPRESS_ADMIN_PW}/$(openssl rand -base64 64 | tr -d '=\n\/')/g" ../.env
sed -i "s/{ADMINER_FILE_NAME}/$(openssl rand -base64 32 | tr -d '=\n\/')/g" ../.env
sed -i "s/{MYSQL_ROOT_PW}/$(openssl rand -base64 64 | tr -d '=\n\/')/g" ../.env
sed -i "s/{MYSQL_USER_PW}/$(openssl rand -base64 64 | tr -d '=\n\/')/g" ../.env
sed -i "s/{REDIS_PW}/$(openssl rand -base64 64 | tr -d '=\n\/')/g" ../.env
sed -i "s/{FTP_PW}/$(openssl rand -base64 64 | tr -d '=\n\/')/g" ../.env