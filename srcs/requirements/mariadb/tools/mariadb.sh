apt-get install -y mariadb-server && \
/etc/init.d/mariadb start && mariadb < create_database.sql && \
rm create_database.sql