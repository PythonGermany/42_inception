ARG =
USER ?=

all: up

# Docker
up: volume_create
	sudo docker compose -f srcs/docker-compose.yml up -d
down:
	sudo docker compose -f srcs/docker-compose.yml down
update:
	sudo docker compose -f srcs/docker-compose.yml build --no-cache --force-rm $(ARG)

# Setup
setup: docker_install env_create ssl_create add_domains
docker_install:
	sudo sh srcs/tools/docker_install.sh $(ARG)
env_create:
	(cd srcs/tools && sh env_create.sh $(USER))
ssl_create:
	(cd srcs/tools && sh ssl_create.sh)
add_domains:
	@sudo sh srcs/tools/add_domain.sh rburgsta.42.fr
	@sudo sh srcs/tools/add_domain.sh rburgsta.example
volume_create:
	mkdir -p /home/rburgsta/data/wordpress
	mkdir -p /home/rburgsta/data/mariadb

# Delete
ssl_delete:
	(cd srcs/tools && sh ssl_delete.sh)
volume_delete:
	sudo rm -rf /home/rburgsta/data/wordpress
	sudo rm -rf /home/rburgsta/data/mariadb

# Utils
files_to_unix:
	sudo apt-get install dos2unix
	find . -type f -exec dos2unix {} +

# Clean and rebuild
clean: down 
	sudo docker image prune -a -f
fclean: clean ssl_delete volume_delete
	sudo docker system prune
	rm -f srcs/.env
re: fclean ssl_create all