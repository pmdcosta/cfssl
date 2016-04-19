FROM cfssl/cfssl:minimal.latest
MAINTAINER Pedro Costa

RUN mkdir /ssl
WORKDIR /ssl/
ADD config /ssl/

CMD ["serve", "-address=0.0.0.0", "-ca=/ssl/ca/ca.pem", "-ca-key=/ssl/ca/ca-key.pem", "-config=/ssl/ca-config.json"]
