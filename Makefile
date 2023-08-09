ARG =
USER ?=

# Colors
BLACK = \033[0;30m
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m
MAGENTA = \033[0;35m
CYAN = \033[0;36m
WHITE = \033[0;37m
RESET = \033[0m

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
	sudo mkdir -p /home/$(USER)/data/wordpress
	sudo mkdir -p /home/$(USER)/data/mariadb

# Delete
env_delete:
	rm -f srcs/.env
ssl_delete:
	(cd srcs/tools && sh ssl_delete.sh)
domains_remove:
	sudo sed -i '/rburgsta.42.fr/d' /etc/hosts
	sudo sed -i '/rburgsta.example/d' /etc/hosts
volume_delete:
	sudo rm -rf /home/$(USER)/data/wordpress
	sudo rm -rf /home/$(USER)/data/mariadb

# Utils
files_to_unix:
	sudo apt-get install dos2unix
	find . -type f -exec dos2unix {} +
help:
	@echo "$(RED)Usage: $(YELLOW)make [target] [ARG=\"...\"] [USER=\"...\"] "
	@echo "Targets:$(RESET)"
	@echo "  all (default)  - Start containers"
	@echo "$(RED)--------------------- Docker ---------------------$(RESET)"
	@echo "  up             - Start containers run 'make create volumes'"
	@echo "  down           - Stop containers"
	@echo "  update         - Rebuild container"
	@echo "$(RED)--------------------- Setup ---------------------"
	@echo "$(YELLOW)  master_setup	  - Run 'make install_docker setup'"
	@echo "$(YELLOW)  setup          - Run 'make env_create ssl_create domains_add'"
	@echo "$(WHITE)  docker_install - Install docker using ARG=\"...\" as OS"
	@echo "$(GREEN)  env_create     - Create .env file using random passwords using ENV var USER=\"...\ as name"
	@echo "$(BLUE)  ssl_create     - Create SSL certificates"
	@echo "$(MAGENTA)  domains_add    - Add domains to /etc/hosts"
	@echo "$(CYAN)  volume_create  - Create volume directories"
	@echo "$(RED)--------------------- Delete ---------------------"
	@echo "$(GREEN)  env_delete     - Delete .env file"
	@echo "$(BLUE)  ssl_delete     - Delete SSL certificates$(RESET)"
	@echo "$(MAGENTA)  domains_remove - Remove domains from /etc/hosts"
	@echo "$(CYAN)  volume_delete  - Delete volume directories"
	@echo "$(RED)--------------------- Utils ---------------------$(RESET)"
	@echo "  files_to_unix  - Convert files to unix format"
	@echo "  help           - Display this help message"
	@echo "$(RED)--------------------- Clean ---------------------$(RESET)"
	@echo "  clean          - Stop containers and delete unused images"
	@echo "  fclean         - Run 'make clean env_delete ssl_delete domains_remove volume_delete'"
	@echo "                   and delete unused volumes and networks"
	@echo "  re             - Run 'make fclean setup up'"

# Clean and rebuild
clean: down
	sudo docker image prune -a -f
fclean: clean env_delete ssl_delete domains_remove volume_delete
	sudo docker system prune -f --volumes
re: fclean setup up