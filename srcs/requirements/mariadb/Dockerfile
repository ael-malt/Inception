FROM debian:bullseye

EXPOSE 3306

ARG SQL_NAME=${SQL_NAME}
ARG SQL_USER=${SQL_USER}
ARG SQL_PASSWORD=${SQL_PASSWORD}
ARG SQL_ROOT_PASSWORD=${SQL_ROOT_PASSWORD}

RUN apt-get update && apt-get install \
        mariadb-server -y && \
        rm -rf /var/lib/apt/lists/*

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY tools/script.sh /etc/script.sh

ENTRYPOINT ["bash", "/etc/script.sh"]