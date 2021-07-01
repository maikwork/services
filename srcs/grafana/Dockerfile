FROM alpine:3.12

#update and upgrade alpine
RUN apk update && apk upgrade

#install apps
RUN apk add libc6-compat \
			supervisor

#grafana
RUN apk add --repository http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
ADD https://dl.grafana.com/oss/release/grafana-7.5.5.linux-amd64.tar.gz /
RUN tar -zxvf grafana-7.5.5.linux-amd64.tar.gz --strip-components=1 -C / && rm grafana-7.5.5.linux-amd64.tar.gz

#telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
COPY ./telegraf.conf		/etc/telegraf/

#configs
COPY ./supervisord.conf 	/etc/

#database
COPY ./grafana.db 			./data/

#port
EXPOSE 3000

#script to start
COPY ./start_services.sh 	/
CMD /start_services.sh