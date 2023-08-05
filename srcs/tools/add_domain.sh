# Add domain to /etc/hosts file if not already there
if ! grep -q "127.0.0.1	$1" /etc/hosts; then
echo "127.0.0.1	$1" >> /etc/hosts
fi