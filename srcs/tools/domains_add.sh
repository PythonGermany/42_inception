DOMAIN=none
while [ -n "$DOMAIN" ]
do
  read -p "domains_add.sh: Enter domain to add (leave empty to continue): " DOMAIN
  if [ -n "$DOMAIN" ]; then
    read -p "domains_add.sh: Enter ip (default -> 127.0.0.1): " IP
    if [ -z "$IP" ]; then
      IP="127.0.0.1"
    fi
    # Add domain to /etc/hosts file if not already there
    if ! grep -q "$IP	$DOMAIN" /etc/hosts; then
      sudo echo "$IP	$DOMAIN" >> /etc/hosts
    fi
  fi
done