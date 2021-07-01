FROM alpine:3.12

#update and upgrade alpine
RUN apk update && apk upgrade

#add apps
RUN apk add nginx php7 php7-fpm php7-mbstring php7-session php7-json php7-mysqli php7-gd php7-xml php7-curl php7-iconv supervisor

#wordpress
ADD https://wordpress.org/latest.tar.gz /var/www
RUN cd /var/www && tar zxvf latest.tar.gz && rm -rf latest.tar.gz && cd wordpress
RUN chmod -R 777 /var/www/wordpress

#telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
COPY ./telegraf.conf	/etc/telegraf/

#copy configs
COPY ./supervisord.conf 	/etc/
COPY ./nginx.conf			/etc/nginx/conf.d/default.conf
COPY ./wp-config.php		/var/www/wordpress

#open port
EXPOSE 5050

#dir for nginx pid
RUN mkdir -p	/run/nginx

#copy and start script
COPY ./start_services.sh	/
CMD /start_services.sh