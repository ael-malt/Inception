NAME = inception

DOCKER = docker-compose -f ./srcs/docker-compose.yml

all:
	# @mkdir /home/ael-malt/data/mariadb /home/ael-malt/data/wordpress
	$(DOCKER) up --build

stop:
	$(DOCKER) stop

rm:
	$(DOCKER) down

# YN := $(shell bash -c 'read -p "This will prune ALL your docker images. Do you want to continue? [Y/N]:"')
# prune:
# 	ifeq "$(YN)", "Y"
# 		@echo "YES"
# 	endif
.PHONY: all