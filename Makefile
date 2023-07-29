all: up

up:
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

update:
	docker compose -f srcs/docker-compose.yml pull

fclean:
	docker image prune -a -f
	docker volume prune -a -f
	rm -rf /home/$(USER)/data

re: fclean all