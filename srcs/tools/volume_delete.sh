read -p "volume_delete.sh: WARNING DANGER ZONE: Deleting your data volumes? (yes/n): " RESPONSE
if [ "$RESPONSE" = "yes" ]; then
  rm -rf /home/$(USER)/data/wordpress
	rm -rf /home/$(USER)/data/mariadb
else
  echo "volume_delete.sh: Aborting."
fi