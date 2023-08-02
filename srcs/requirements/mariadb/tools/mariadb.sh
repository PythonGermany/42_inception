apt-get install -y mariadb-server && \

mv 50-server.cnf /etc/mysql/mariadb.conf.d && \

/etc/init.d/mariadb start && \
mariadb < create_database.sql && \
rm create_database.sql