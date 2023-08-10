ADD_DOMAIN=y
while [ "$ADD_DOMAIN" = "y" ]
do
  read -p "Enter domain name: " DOMAIN
  # Add domain to /etc/hosts file if not already there
  if ! grep -q "127.0.0.1	$DOMAIN" /etc/hosts; then
    echo "127.0.0.1	$DOMAIN" >> /etc/hosts
  fi
  read -p "Add another domain? (y/n): " ADD_DOMAIN
done