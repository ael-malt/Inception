NAME = inception

DOCKER = docker-compose -f ./srcs/docker-compose.yml

all:
	$(DOCKER) up -d --build

stop:
	$(DOCKER) stop

rm:
	$(DOCKER) down -f

# YN := $(shell bash -c 'read -p "This will prune ALL your docker images. Do you want to continue? [Y/N]:"')
# prune:
# 	ifeq "$(YN)", "Y"
# 		@echo "YES"
# 	endif
.PHONY: all