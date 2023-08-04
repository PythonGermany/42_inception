# Install requirements for redis
apt-get install -y redis-server && \

# Set up redis config
sed -i "s/{REDIS_PASSWORD}/$REDIS_PW/g" redis.conf && \

# Move config files to their respective locations
mv redis.conf /etc/redis/