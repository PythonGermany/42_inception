apt-get install -y vsftpd ssl-cert && \
make-ssl-cert generate-default-snakeoil && \
mv vsftpd.conf /etc/vsftpd.conf && \
mkdir -p /ftp/files && \
useradd -d /ftp rburgsta && \
chown nobody:nogroup  /ftp && chmod a-w /ftp && \
chown rburgsta:rburgsta /ftp/files && \
echo "rburgsta" >> /etc/vsftpd.userlist