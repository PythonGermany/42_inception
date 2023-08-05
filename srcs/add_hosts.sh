if ! grep -q "127.0.0.1	rburgsta.42.fr" /etc/hosts; then
echo "127.0.0.1	rburgsta.42.fr" >> /etc/hosts
fi
if ! grep -q "127.0.0.1	rburgsta.example" /etc/hosts; then
echo "127.0.0.1	rburgsta.example" >> /etc/hosts
fi