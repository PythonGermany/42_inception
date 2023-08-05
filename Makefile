CONTAINER ?= none

all: up

up: create_volume_folders
	@sh srcs/add_hosts.sh
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

update:
	docker compose -f srcs/docker-compose.yml build --no-cache --force-rm $(CONTAINER)

create_ssl:
	(cd srcs && sh setup_ssl.sh)

delete_ssl:
	(cd srcs && sh delete_ssl.sh)

create_volume_folders:
	mkdir -p /home/rburgsta/data/wordpress
	mkdir -p /home/rburgsta/data/mariadb

delete_volume_folders:
	rm -rf /home/rburgsta/data/wordpress
	rm -rf /home/rburgsta/data/mariadb

clean: down 
	docker image prune -a -f

fclean: clean delete_volume_folders
	docker system prune

re: fclean all