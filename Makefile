all: up

up:
	docker compose -f srcs/docker-compose.yml up

down:
	docker compose -f srcs/docker-compose.yml down

update:
	docker compose -f srcs/docker-compose.yml pull

fclean:
	docker image prune -a
	docker volume prune -a

re: fclean all