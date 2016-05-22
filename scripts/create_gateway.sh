#!/usr/bin/env bash

# Create RabbitMQ development gateway credentials
echo '{"CN":"gateway","hosts":[""],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/data/development/ca/ca.pem -ca-key=/ssl/data/development/ca/ca-key.pem -config=/ssl/config/ca-config.json -profile=client - | cfssljson -bare client > /dev/null
echo ">> client.pem:"
cat client.pem
echo ">> client-key.pem:"
cat client-key.pem
rm *.csr
rm *.pem
