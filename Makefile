ARG ?= none

all: up

up: volume_create
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

update:
	docker compose -f srcs/docker-compose.yml build --no-cache --force-rm $(ARG)

setup: install_docker add_domains ssl_create

add_domains:
	@sh srcs/tools/add_domain.sh rburgsta.42.fr
	@sh srcs/tools/add_domain.sh rburgsta.example

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

install_docker:
	managevm/install_docker.sh $(ARG)

clean: down 
	docker image prune -a -f

fclean: clean volume_delete
	docker system prune

re: fclean all