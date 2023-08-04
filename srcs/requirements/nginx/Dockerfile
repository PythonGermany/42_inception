FROM debian:oldstable

# Domain name argments
ARG DOMAIN_NAME_ARG
# Wordpress argments
ARG WORDPRESS_HOST_ARG
ARG WORDPRESS_PORT_ARG

# Domain name env
ENV DOMAIN_NAME=$DOMAIN_NAME_ARG
# Wordpress env
ENV WORDPRESS_HOST=$WORDPRESS_HOST_ARG
ENV WORDPRESS_PORT=$WORDPRESS_PORT_ARG

COPY conf/. .
COPY tools/. .
COPY ssl/ssl.crt /etc/ssl/certs/ssl-cert-snakeoil.pem
COPY ssl/ssl.key /etc/ssl/private/ssl-cert-snakeoil.key

RUN apt-get update && apt-get upgrade -y && sh nginx.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]