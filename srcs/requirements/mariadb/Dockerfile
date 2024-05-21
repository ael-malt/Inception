FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/script.sh /etc/script.sh
RUN chmod +x /etc/script.sh

EXPOSE 3036

ENTRYPOINT ["sh", "/etc/script.sh"]
