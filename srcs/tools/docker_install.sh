if [ "$#" -eq 0 ]; then
  echo "ERROR: docker_install.sh: missing argument to specify OS"
  exit 1
fi
# Update the apt package index and install packages to allow apt to use a repository over HTTPS
apt-get update
apt-get install -y ca-certificates curl gnupg
# Add Docker’s official GPG key
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/$1/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
# Set up the repository
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/$1 \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
# Update the apt package index and install the latest version of Docker Engine
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin