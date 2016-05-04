FROM cfssl/cfssl:minimal.latest
MAINTAINER Pedro Costa

ENTRYPOINT []
RUN apk add --update bash nano

RUN mkdir /ssl/
WORKDIR /ssl/

ADD config /ssl/config
ADD scripts /ssl/scripts

CMD ["sleep", "infinity"]
