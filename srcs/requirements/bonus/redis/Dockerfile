FROM debian:oldstable

ARG REDIS_PW_ARG

ENV REDIS_PW=$REDIS_PW_ARG

COPY conf/. .
COPY tools/. .
RUN apt-get update && apt-get upgrade -y && sh redis.sh

CMD [ "sleep", "infinity"]