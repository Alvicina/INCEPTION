FROM debian:bullseye

#instalacion de todos los programas
RUN apt-get update && \
    apt-get install -y nginx && \
    #apt-get install -y php-fpm && \
    #apt-get install -y php-mysql && \
    apt-get install -y openssl && \
    apt-get clean

#nginx SSL generacion certificados TSL
RUN mkdir /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/alvicina.crt \
	-keyout /etc/nginx/ssl/alvicina.key \
	-subj "/C=SP/ST=Bizkaia/L=Urduliz/O=42 School/OU=alvicina/CN=alvicina/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

COPY /webs/. /var/www/html

EXPOSE 443
 
CMD ["nginx", "-g", "daemon off;"]
