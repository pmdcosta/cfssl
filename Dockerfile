FROM cfssl/cfssl:minimal.latest
MAINTAINER Pedro Costa

RUN mkdir -p /ssl/data
ADD config /ssl/config
WORKDIR /ssl/

CMD ["serve", "-address=0.0.0.0", "-ca=/ssl/data/ca/ca.pem", "-ca-key=/ssl/data/ca/ca-key.pem", "-config=/ssl/config/ca-config.json"]
