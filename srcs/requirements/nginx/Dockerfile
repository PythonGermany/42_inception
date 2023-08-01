FROM debian:oldstable

RUN apt-get update && apt-get upgrade -y && sh nginx.sh

COPY conf/default /etc/nginx/sites-available

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]