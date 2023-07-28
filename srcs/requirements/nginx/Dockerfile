FROM debian:oldstable

COPY tools/setup.sh .
RUN sh setup.sh

EXPOSE 433

CMD ["nginx", "-g", "daemon off;"]