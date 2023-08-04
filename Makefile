all: up

up: create_volume_folders
	docker compose -f srcs/docker-compose.yml up -d

create_volume_folders:
	mkdir -p /home/rburgsta/data/wordpress
	mkdir -p /home/rburgsta/data/mariadb

delete_volume_folders:
	rm -rf /home/rburgsta/data/wordpress
	rm -rf /home/rburgsta/data/mariadb

down:
	docker compose -f srcs/docker-compose.yml down

clean: down 
	docker image prune -a -f

fclean: clean delete_volume_folders
	docker system prune

re: fclean all