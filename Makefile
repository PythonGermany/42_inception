ARG = none
USER ?=

all: up

up: volume_create
	sudo docker compose -f srcs/docker-compose.yml up -d

down:
	sudo docker compose -f srcs/docker-compose.yml down

update:
	sudo docker compose -f srcs/docker-compose.yml build --no-cache --force-rm $(ARG)

setup: install_docker env_create ssl_create add_domains

add_domains:
	@sudo sh srcs/tools/add_domain.sh rburgsta.42.fr
	@sudo sh srcs/tools/add_domain.sh rburgsta.example

env_create:
	(cd srcs/tools && sh env_create.sh $(USER))

ssl_create:
	(cd srcs/tools && sh ssl_create.sh)

ssl_delete:
	(cd srcs/tools && sh ssl_delete.sh)

volume_create:
	mkdir -p /home/rburgsta/data/wordpress
	mkdir -p /home/rburgsta/data/mariadb

volume_delete:
	rm -rf /home/rburgsta/data/wordpress
	rm -rf /home/rburgsta/data/mariadb

docker_install:
	sudo sh srcs/tools/docker_install.sh $(ARG)

files_to_unix:
	sudo apt-get install dos2unix
	find . -type f -exec dos2unix {} +

clean: down 
	sudo docker image prune -a -f

fclean: clean volume_delete
	sudo docker system prune

re: fclean all