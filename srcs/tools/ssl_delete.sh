# Delete SSL directories and files
find ../ -type d -name ".ssl" -exec rm -rf {} +
find ../ -type f -name "*.pem" -exec rm -rf {} +