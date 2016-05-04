#!/usr/bin/env bash

# Create RabbitMQ development cluster credentials
echo '{"CN":"cluster","hosts":[""],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/data/development/ca/ca.pem -ca-key=/ssl/data/development/ca/ca-key.pem -config=/ssl/config/ca-config.json -profile=client - | cfssljson -bare client
mv *.pem /ssl/data/development/cluster
rm *.csr
# Create RabbitMQ development gateway credentials
echo '{"CN":"gateway","hosts":[""],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/data/development/ca/ca.pem -ca-key=/ssl/data/development/ca/ca-key.pem -config=/ssl/config/ca-config.json -profile=client - | cfssljson -bare client
mv *.pem /ssl/data/development/gateway
rm *.csr
# Create RabbitMQ production cluster credentials
echo '{"CN":"cluster","hosts":[""],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/data/production/ca/ca.pem -ca-key=/ssl/data/production/ca/ca-key.pem -config=/ssl/config/ca-config.json -profile=client - | cfssljson -bare client
mv *.pem /ssl/data/production/cluster
rm *.csr
# Create RabbitMQ production gateway credentials
echo '{"CN":"gateway","hosts":[""],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/data/production/ca/ca.pem -ca-key=/ssl/data/production/ca/ca-key.pem -config=/ssl/config/ca-config.json -profile=client - | cfssljson -bare client
mv *.pem /ssl/data/production/gateway
rm *.csr