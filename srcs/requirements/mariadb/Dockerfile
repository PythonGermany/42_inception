FROM debian:oldstable

COPY conf/create_database.sql create_database.sql
RUN apt-get update && apt-get upgrade -y && sh mariadb.sh

CMD [ "sleep", "infinity"]