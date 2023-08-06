if [ "$#" -eq 0 ]; then
  echo "master_start.sh: missing argument to specify OS"
  exit 1
fi
sudo apt-get install -y make
make setup ARG=$1
make up