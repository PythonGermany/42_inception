FROM debian:oldstable

COPY conf/. .
COPY tools/. .
RUN apt-get update && apt-get upgrade -y && sh nginx.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]