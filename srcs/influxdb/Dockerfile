FROM alpine:3.12

#update and upgrade alpine
RUN apk update && apk upgrade

#add apps
RUN apk add supervisor\
			influxdb\
			libc6-compat

#telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
COPY ./telegraf.conf		/etc/telegraf/

#copy configs
COPY ./supervisord.conf /etc/

#open ports
EXPOSE 8086

#copy and start script
COPY ./start_services.sh /
CMD /start_services.sh