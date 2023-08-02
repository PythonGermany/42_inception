FROM debian:oldstable

COPY conf/. .
COPY tools/. .
RUN apt-get update && apt-get upgrade -y && sh wordpress.sh

CMD ["/usr/sbin/php-fpm7.4", "-F"]