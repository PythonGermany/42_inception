FROM debian:oldstable

COPY conf/. .
COPY tools/. .
RUN apt-get update && apt-get upgrade -y && ./ftp.sh

EXPOSE 20 21 990
EXPOSE 47400-47470

CMD [ "sleep", "infinity"]