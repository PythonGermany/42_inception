FROM debian:oldstable

# Database arguments
ARG MYSQL_DB_ARG
ARG MYSQL_USER_ARG
ARG MYSQL_PW_ARG
ARG MYSQL_HOST_ARG
# Redis arguments
ARG REDIS_HOST_ARG
ARG REDIS_PW_ARG

# Database environment variables
ENV MYSQL_DB=$MYSQL_DB_ARG
ENV MYSQL_USER=$MYSQL_USER_ARG
ENV MYSQL_PW=$MYSQL_PW_ARG
ENV MYSQL_HOST=$MYSQL_HOST_ARG
# Redis environment variables
ENV REDIS_HOST=$REDIS_HOST_ARG
ENV REDIS_PW=$REDIS_PW_ARG

COPY conf/. .
COPY tools/. .
RUN apt-get update && apt-get upgrade -y && sh wordpress.sh

CMD ["/usr/sbin/php-fpm7.4", "-F"]