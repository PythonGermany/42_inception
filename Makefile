all: up

up:
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

update:
	cd srcs; docker-compose build --force-rm --no-cache

fclean:
	docker image prune -a -f
	docker volume prune -a -f
	rm -rf /home/rburgsta/data

re: fclean all