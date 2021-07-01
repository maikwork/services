FROM alpine:3.12

#update and upgrade alpine
RUN apk update && apk upgrade

#install apps
RUN apk add libc6-compat\
			supervisor\
			vsftpd\
			openssl
#telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
COPY ./telegraf.conf		/etc/telegraf/

#openssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21moscow/CN=rbliss" -newkey rsa:2048 -keyout /etc/vsftpd/vsftpd.key -out /etc/vsftpd/vsftpd.crt

#add configs
COPY ./supervisord.conf		/etc/
COPY ./vsftpd.conf			/etc/vsftpd/

#add user
RUN adduser -D -g 'rbliss' rbliss
RUN echo "rbliss:pass" | chpasswd

#open ports
EXPOSE 21 21000

#add script to start services
COPY ./start_services.sh	/
CMD /start_services.sh