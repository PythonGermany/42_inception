FROM debian:oldstable

COPY conf/. .
COPY tools/. .
RUN apt-get update && apt-get upgrade -y && sh ftp.sh

CMD [ "sleep", "infinity"]