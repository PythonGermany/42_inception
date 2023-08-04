FROM debian:oldstable

ARG FTP_USER_ARG
ARG FTP_PW_ARG

ENV FTP_USER=$FTP_USER_ARG
ENV FTP_PW=$FTP_PW_ARG

COPY conf/. .
COPY tools/. .
RUN apt-get update && apt-get upgrade -y && sh ftp.sh

EXPOSE 20 21 990
EXPOSE 47400-47470

CMD [ "/usr/sbin/vsftpd"]