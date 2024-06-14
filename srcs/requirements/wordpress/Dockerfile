
FROM debian:bullseye
 
RUN  apt-get update && \
     apt-get upgrade && \
     apt-get -y install wget && \
#    apt-get install -y php7.4 && \
     apt-get -y install php-fpm && \
     apt-get -y install php7.4-mysql && \
     apt-get -y install sendmail && \
     apt-get clean

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY ./tools/wordpress.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/wordpress.sh

RUN mkdir -p /run/php

EXPOSE 9000

#WORKDIR /var/www/wordpress/

#ENTRYPOINT ["../../../usr/local/bin/wordpress.sh"]

CMD ["/usr/local/bin/wordpress.sh"]


