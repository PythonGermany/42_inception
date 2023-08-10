ADD_DOMAIN=y
while [ "$ADD_DOMAIN" = "y" ]
do
  read -p "domains_add.sh: Enter domain name: " DOMAIN
  read -p "domains_add.sh: Enter ip (default -> 127.0.0.1): " IP
  if [ -z "$IP" ]; then
    IP="127.0.0.1"
  fi
  # Add domain to /etc/hosts file if not already there
  if ! grep -q "$IP	$DOMAIN" /etc/hosts; then
    sudo echo "$IP	$DOMAIN" >> /etc/hosts
  fi
  read -p "domains_add.sh: Add another domain? (y/n): " ADD_DOMAIN
done