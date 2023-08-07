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
master_setup: docker_install setup
setup: env_create ssl_create domains_add
docker_install:
	sudo sh srcs/tools/docker_install.sh $(ARG)
env_create:
	(cd srcs/tools && sh env_create.sh $(USER))
ssl_create:
	(cd srcs/tools && sh ssl_create.sh)
domains_add:
	@sudo sh srcs/tools/domain_add.sh rburgsta.42.fr
	@sudo sh srcs/tools/domain_add.sh rburgsta.example
volume_create:
	mkdir -p /home/rburgsta/data/wordpress
	mkdir -p /home/rburgsta/data/mariadb

# Delete
env_delete:
	rm -f srcs/.env
ssl_delete:
	(cd srcs/tools && sh ssl_delete.sh)
domains_remove:
	@sudo sh srcs/tools/domain_remove.sh rburgsta.42.fr
	@sudo sh srcs/tools/domain_remove.sh rburgsta.example
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
fclean: clean env_delete ssl_delete domains_remove volume_delete
	sudo docker system prune
	rm -f srcs/.env
re: fclean setup all