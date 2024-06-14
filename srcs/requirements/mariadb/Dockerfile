FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install mariadb-server -y && \
    apt-get clean

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    chmod 777 /var/run/mysqld

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/* /usr/local/bin/

RUN chmod +x /usr/local/bin/mariadb.sh

#RUN chmod +x /usr/local/bin/mariadb2.sh

CMD ["/usr/local/bin/mariadb.sh"]	 

#VOLUME ["/var/lib/mysql"]


