DOMAIN=none
while [ -n "$DOMAIN" ]
do
  read -p "domains_remove.sh: Enter domain to remove (leave empty to continue): " DOMAIN
  if [ -n "$DOMAIN" ]; then
    # Remove domain from /etc/hosts file
    sudo sed -i "/$DOMAIN/d" /etc/hosts
  fi
done