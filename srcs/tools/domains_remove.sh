REMOVE_DOMAIN=y
while [ "$REMOVE_DOMAIN" = "y" ]
do
  read -p "domains_remove.sh: Enter domain name: " DOMAIN
  # Remove domain from /etc/hosts file
  sudo sed -i "/$DOMAIN/d" /etc/hosts
  read -p "domains_remove.sh: Remove another domain? (y/n): " REMOVE_DOMAIN
done