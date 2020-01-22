FROM alpine:latest
#FROM portainer/portainer:latest
#FROM portainer/base
MAINTAINER Jia Yiqiu <yiqiujia@hotmail.com>

RUN apk add --update iptables && \
    rm -rf /var/cache/apk/*

ADD portainer-portainer-latest-5-cc61cd4105c3.layer.tar.gz /
ADD iptables.sh	/
RUN chmod +x /portainer && \
	chmod +x /iptables.sh
ENV LANIP=172.18.0.1
VOLUME /data
EXPOSE 9000/tcp

#ENTRYPOINT ["/portainer"]
CMD /iptables.sh ; /portainer ; bash

#docker build -t land007/portainer .
#docker run -it --rm --name portainer -v /var/run/docker.sock:/var/run/docker.sock -p 9001:9000 --privileged land007/portainer
