FROM alpine:3.12

#update and upgrade alpine
RUN apk update && apk upgrade

#add apps
RUN apk add openrc\
			mysql\
			mysql-client\
			libc6-compat\
			supervisor

#telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
COPY ./telegraf.conf	/etc/telegraf/

#copy configs
COPY ./supervisord.conf 	/etc/
COPY ./create_db.sql 		/
COPY ./wordpress.sql 		/
COPY ./my.cnf 				/etc/

#open ports
EXPOSE 3306

#copy and start script
COPY ./start_services.sh	/
CMD /start_services.sh