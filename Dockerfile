FROM alpine

MAINTAINER NOBODY

RUN apk update && \
	apk add --no-cache --update bash && \
	apk add --no-cache --update aria2 && \
	apk add git && \
	git clone https://github.com/ziahamza/webui-aria2 /aria2-webui && \
   	rm /aria2-webui/.git* -rf && \
    	apk del git && \
	apk add --update darkhttpd && \
	addgroup -g 1000 abc && \
	adduser -u 1000 -D --no-create-home -G abc -G www-data abc

COPY files/start.sh /conf-copy/start.sh
COPY files/aria2.conf /conf-copy/aria2.conf
COPY files/on-complete.sh /conf-copy/on-complete.sh

RUN chmod +x /conf-copy/start.sh

WORKDIR /
VOLUME ["/data"]
VOLUME ["/conf"]
EXPOSE 6800
EXPOSE 8080
EXPOSE 8081

CMD ["/conf-copy/start.sh"]
