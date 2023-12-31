ARG =

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
setup: env_create ssl_create domains_add
docker_install:
	@sudo sh srcs/tools/docker_install.sh $(ARG)
env_create:
	@(cd srcs/tools && sh env_create.sh)
ssl_create:
	@(cd srcs/tools && sh ssl_create.sh)
domains_add:
	@sudo sh srcs/tools/domains_add.sh
volume_create:
	mkdir -p /home/$(USER)/data/wordpress
	mkdir -p /home/$(USER)/data/mariadb

# Delete
env_delete:
	@(cd srcs/tools && sh env_delete.sh)
ssl_delete:
	@(cd srcs/tools && sh ssl_delete.sh)
domains_remove:
	@sudo sh srcs/tools/domains_remove.sh
volume_delete:
	@(cd srcs/tools && sh volume_delete.sh)

# Utils
files_to_unix:
	sudo apt-get install dos2unix
	find . -type f -exec dos2unix {} +
help:
	@echo "$(RED)Usage: $(YELLOW)make [target] [ARG=\"...\"]"
	@echo "Targets:$(RESET)"
	@echo "  all (default)  - Run 'make up'"
	@echo "$(RED)--------------------- Docker ---------------------$(RESET)"
	@echo "  up             - Start containers and run '$(CYAN)make volume_delete$(RESET)'"
	@echo "  down           - Stop containers"
	@echo "  update         - Rebuild container"
	@echo "$(RED)--------------------- Setup ---------------------"
	@echo "$(YELLOW)  setup          - Run 'make $(GREEN)env_create $(BLUE)ssl_create $(MAGENTA)domains_add$(YELLOW)'"
	@echo "$(WHITE)  docker_install - Install docker"
	@echo "$(GREEN)  env_create     - Create .env file using random passwords"
	@echo "$(BLUE)  ssl_create     - Create SSL certificates"
	@echo "$(MAGENTA)  domains_add    - Add domains to /etc/hosts"
	@echo "$(CYAN)  volume_create  - Create volume directories"
	@echo "$(RED)--------------------- Delete ---------------------"
	@echo "$(GREEN)  env_delete     - Delete .env file"
	@echo "$(BLUE)  ssl_delete     - Delete SSL certificates"
	@echo "$(MAGENTA)  domains_remove - Remove domains from /etc/hosts"
	@echo "$(CYAN)  volume_delete  - Delete volume directories"
	@echo "$(RED)--------------------- Utils ---------------------$(RESET)"
	@echo "  files_to_unix  - Convert files to unix format"
	@echo "  help           - Display this help message"
	@echo "$(RED)--------------------- Clean ---------------------$(RESET)"
	@echo "  clean          - run 'make down' and delete unused images"
	@echo "$(RED)  fclean         - Run 'make $(WHITE)clean $(GREEN)env_delete $(BLUE)ssl_delete $(MAGENTA)domains_remove"
	@echo "                        $(CYAN)volume_delete$(RESET)' and delete unused images"
	@echo "$(RED)  re             - Run 'make fclean setup up'$(RESET)"

# Clean and rebuild
clean: down
	sudo docker image prune -a -f
fclean: clean env_delete ssl_delete domains_remove volume_delete
	sudo docker system prune -f --volumes
re: fclean setup up