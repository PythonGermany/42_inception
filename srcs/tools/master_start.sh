if [ "$#" -eq 0 ]; then
  echo "ERROR: docker_install.sh: missing argument to specify OS"
  exit 1
fi
sudo apt-get install -y make gpm ftp
make master_setup ARG=$1
make up