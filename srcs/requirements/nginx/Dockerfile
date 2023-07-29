FROM debian:oldstable

COPY tools/setup.sh .
RUN sh setup.sh

COPY conf/rburgsta.42.fr.conf /etc/nginx/sites-available
COPY conf/ssl.crt /etc/nginx/ssl
COPY conf/ssl.key /etc/nginx/ssl

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]