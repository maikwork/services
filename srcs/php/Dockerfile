FROM alpine:3.12

#update and upgrade alpine
RUN apk update && apk upgrade

#install apps
RUN apk add nginx php7 php7-fpm php7-mbstring php7-session php7-json php7-mysqli php7-gd php7-xml php7-curl php7-iconv supervisor

#install phpmyadmin
ADD https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz /var/www
RUN cd /var/www && tar zxvf phpMyAdmin-5.1.0-english.tar.gz && rm phpMyAdmin-5.1.0-english.tar.gz && mv phpMyAdmin-5.1.0-english phpmyadmin && cd phpmyadmin 

#???
RUN chmod -R 777 /var/www/phpmyadmin 

#install telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
COPY ./telegraf.conf	/etc/telegraf/

#add configs
COPY ./supervisord.conf 	/etc/
COPY ./nginx.conf			/etc/nginx/conf.d/default.conf
COPY ./config.inc.php 		/var/www/phpmyadmin

#open port
EXPOSE 5000

#make dir for pid 
RUN mkdir -p	/run/nginx

#add and start services
COPY ./start_services.sh	/
CMD /start_services.sh