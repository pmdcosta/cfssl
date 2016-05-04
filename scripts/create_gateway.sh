#!/usr/bin/env bash

# Create RabbitMQ development gateway credentials
echo '{"CN":"gateway","hosts":[""],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/data/production/ca/ca.pem -ca-key=/ssl/data/production/ca/ca-key.pem -config=/ssl/config/ca-config.json -profile=client - | cfssljson -bare client
echo ">> Gateway Certificate:"
cat client.pem
echo ">> Gateway Key:"
cat client-key.pem
rm *.csr
rm *.pem
