#!/bin/sh
if [ ! -f /conf/aria2.conf ]; then
	cp /conf-copy/aria2.conf /conf/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> /conf/aria2.conf
	fi
fi
if [ ! -f /conf/on-complete.sh ]; then
	cp /conf-copy/on-complete.sh /conf/on-complete.sh
fi

chmod +x /conf-copy/on-complete.sh
touch /conf/aria2.session
chown -R abc:www-data /conf
chown -R abc:www-data /data

su abc -c "darkhttpd /aria2-webui/docs --port 8081" &
su abc -c "darkhttpd /data --port 8080" &
su abc -c "aria2c --conf-path=/conf/aria2.conf"
