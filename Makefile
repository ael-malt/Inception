NAME = inception

DOCKER = docker-compose -f ./srcs/docker-compose.yml

USER	= ael-malt

all: 
	sudo mkdir -p /home/$(USER)/data/wp
	sudo mkdir -p /home/$(USER)/data/db	
	$(DOCKER) up --build -d

clean:
	$(DOCKER) down -v

fclean: clean
	docker system prune -af --volumes
	sudo rm -fr /home/$(USER)/data/wp/*
	sudo rm -fr /home/$(USER)/data/db/*

stop:
	$(DOCKER) stop

re: clean all

.PHONY: all clean fclean stop re