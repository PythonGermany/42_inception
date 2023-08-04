SET PASSWORD FOR 'root'@'localhost' = PASSWORD('{MYSQL_ROOT_PW}');
CREATE DATABASE {MYSQL_DB} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER '{MYSQL_USER}'@'wordpress.srcs_docker-network' IDENTIFIED BY '{MYSQL_PW}';
GRANT ALL ON {MYSQL_DB}.* TO '{MYSQL_USER}'@'wordpress.srcs_docker-network';
FLUSH PRIVILEGES;