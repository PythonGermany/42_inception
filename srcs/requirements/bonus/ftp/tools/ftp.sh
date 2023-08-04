# Install requirements for ftp
apt-get install -y vsftpd ssl-cert && \

# Move config files to their respective locations
mv vsftpd.conf /etc/ && \

# Generate self-signed SSL certificate
make-ssl-cert generate-default-snakeoil && \

mkdir -p /var/run/vsftpd/empty && \
mkdir -p /home/$FTP_USER/ftp/files && \

# Set up ftp nologin shell
echo 'echo "This account is limited to FTP access only."' >> /bin/ftponly && \
echo "/bin/ftponly" >> /etc/shells
chmod a+x /bin/ftponly && \

# Set up ftp user
useradd $FTP_USER -s /bin/ftponly && \
echo "$FTP_USER:$FTP_PW" | chpasswd && \
echo "$FTP_USER" >> /etc/vsftpd.userlist && \

chmod a-w /home/$FTP_USER/ftp && \
chmod a-w /var/run/vsftpd/empty && \

chown nobody:nogroup /home/$FTP_USER/ftp && \
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files
