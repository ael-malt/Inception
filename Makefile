NAME = inception

DOCKER = sudo docker compose -f ./srcs/docker-compose.yml

USER	= ael-malt

all: 
	sudo mkdir -p /home/$(USER)/data/wordpress
	sudo mkdir -p /home/$(USER)/data/mariadb
	$(DOCKER) up --build -d

clean:
	$(DOCKER) down -v

fclean: clean
	sudo docker system prune -af --volumes
	sudo rm -fr /home/$(USER)/data/*

stop:
	$(DOCKER) stop

re: clean all

.PHONY: all clean fclean stop re