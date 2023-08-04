FROM debian:oldstable

ARG MYSQL_ROOT_PW_ARG
ARG MYSQL_DB_ARG
ARG MYSQL_USER_ARG
ARG MYSQL_PW_ARG

ENV MYSQL_ROOT_PW=$MYSQL_ROOT_PW_ARG
ENV MYSQL_DB=$MYSQL_DB_ARG
ENV MYSQL_USER=$MYSQL_USER_ARG
ENV MYSQL_PW=$MYSQL_PW_ARG

COPY conf/. .
COPY tools/. .
RUN apt-get update && apt-get upgrade -y && sh mariadb.sh

CMD [ "/usr/sbin/mariadbd"]