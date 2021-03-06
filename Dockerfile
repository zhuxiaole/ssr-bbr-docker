FROM alpine

MAINTAINER zhuxiaole

ENV SSR_VERSION=3.2.2
ENV WORK=~

ENV SERVER_ADDR     0.0.0.0
ENV SERVER_PORT     51348
ENV PASSWORD        psw
ENV METHOD          chacha20
ENV PROTOCOL        auth_sha1_v4
ENV PROTOCOLPARAM   32
ENV OBFS            tls1.2_ticket_auth
ENV TIMEOUT         300
ENV DNS_ADDR        8.8.8.8
ENV DNS_ADDR_2      8.8.4.4

RUN apk --no-cache add python \
	libsodium \
	wget


RUN mkdir -p $WORK && \
	wget -qO- --no-check-certificate https://github.com/shadowsocksrr/shadowsocksr/archive/$SSR_VERSION.tar.gz | tar -xzf - -C $WORK

ADD start.sh /start.sh
RUN chmod a+x /*.sh


EXPOSE $SERVER_PORT

CMD ["/start.sh"]
