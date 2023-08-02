CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'wordpress_user'@'srcs-wordpress-1' IDENTIFIED BY 'wordpress_password';
GRANT ALL ON wordpress.* TO 'wordpress_user'@'srcs-wordpress-1';
FLUSH PRIVILEGES;