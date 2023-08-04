# Install requirements for mariadb
apt-get install -y mariadb-server && \

# Move config files to their respective locations
mv 50-server.cnf /etc/mysql/mariadb.conf.d/ && \

# Set up mariadb initialization script
sed -i "s/{MYSQL_ROOT_PW}/$MYSQL_ROOT_PW/g" create_database.sql && \
sed -i "s/{MYSQL_DB}/$MYSQL_DB/g" create_database.sql && \
sed -i "s/{MYSQL_USER}/$MYSQL_USER/g" create_database.sql && \
sed -i "s/{MYSQL_PW}/$MYSQL_PW/g" create_database.sql && \

# Start and initialize mariadb
/etc/init.d/mariadb start && \
mariadb < create_database.sql && \

rm -rf create_database.sql