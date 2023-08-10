REMOVE_DOMAIN=y
while [ "$REMOVE_DOMAIN" = "y" ]
do
  read -p "Enter domain name: " DOMAIN
  # Remove domain from /etc/hosts file
  sed -i "/$DOMAIN/d" /etc/hosts
  read -p "Remove another domain? (y/n): " REMOVE_DOMAIN
done