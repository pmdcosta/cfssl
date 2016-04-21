FROM cfssl/cfssl:minimal.latest
MAINTAINER Pedro Costa

RUN apk add --update bash

RUN mkdir -p /ssl/data
ADD config /ssl/
WORKDIR /ssl/

ENTRYPOINT ["/bin/bash"]
CMD ["/ssl/create.sh"]
