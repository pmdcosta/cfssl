FROM cfssl/cfssl:minimal.latest
MAINTAINER Pedro Costa

RUN mkdir -p /ssl/ca
ADD config/ca-config.json /ssl/
ADD examples/ /examples
WORKDIR /ssl/

CMD ["serve", "-address=0.0.0.0", "-ca=/ssl/ca/ca.pem", "-ca-key=/ssl/ca/ca-key.pem", "-config=/ssl/ca-config.json"]
