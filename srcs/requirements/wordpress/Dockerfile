FROM debian:oldstable

COPY conf/wp-config.php .
RUN apt-get update && apt-get upgrade -y && sh wordpress.sh

CMD ["sleep", "infinity"]