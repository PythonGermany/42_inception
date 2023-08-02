apt-get install -y vsftpd ssl-cert && \

mv vsftpd.conf /etc/vsftpd.conf && \

mkdir -p /var/run/vsftpd/empty && \
mkdir -p /home/rftp_user/ftp/files && \

make-ssl-cert generate-default-snakeoil && \

echo 'echo "This account is limited to FTP access only."' >> /bin/ftponly && \
echo "/bin/ftponly" >> /etc/shells
chmod a+x /bin/ftponly && \

useradd rftp_user -s /bin/ftponly && \
echo "rftp_user:password" | chpasswd && \
echo "rftp_user" >> /etc/vsftpd.userlist && \

chown nobody:nogroup /home/rftp_user/ftp && \
chown -R rftp_user:rftp_user /home/rftp_user/ftp/files && \

chmod a-w /home/rftp_user/ftp && \
chmod a-w /var/run/vsftpd/empty