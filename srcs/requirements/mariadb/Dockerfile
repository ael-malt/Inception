FROM debian:bullseye

EXPOSE 3306

RUN apt-get update && apt-get install \
        mariadb-server -y && \
        rm -rf /var/lib/apt/lists/*

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 755 /var/run/mysqld

COPY tools/script.sh /etc/script.sh
RUN chmod 755 /etc/script.sh
ENTRYPOINT ["bash", "/etc/script.sh"]