#!/usr/bin/env bash

# Development secrets
mkdir /ssl/data/development
## Qold CA
cfssl gencert -initca /ssl/ca-csr.json | cfssljson -bare ca -
mkdir /ssl/data/development/ca
mv *.pem /ssl/data/development/ca
rm *.csr
## RabbitMQ server credentials
echo '{"CN":"cloud.qold.co","hosts":["cloud.qold.co, kube-minion01.cloud.qold.co, kube-minion02.cloud.qold.co, rabbitmq-dev"],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/data/development/ca/ca.pem -ca-key=/ssl/data/development/ca/ca-key.pem -config=/ssl/ca-config.json -profile=server -hostname="cloud.qold.co, kube-minion01.cloud.qold.co, kube-minion02.cloud.qold.co, rabbitmq-dev" - | cfssljson -bare server
mkdir /ssl/data/development/rabbitmq
mv *.pem /ssl/data/development/rabbitmq
rm *.csr
## RabbitMQ gateway credentials
echo '{"CN":"gateway","hosts":[""],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/data/development/ca/ca.pem -ca-key=/ssl/data/development/ca/ca-key.pem -config=/ssl/ca-config.json -profile=client - | cfssljson -bare client
mkdir /ssl/data/development/gateway
mv *.pem /ssl/data/development/gateway
rm *.csr
## RabbitMQ cluster credentials
echo '{"CN":"cluster","hosts":[""],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/data/development/ca/ca.pem -ca-key=/ssl/data/development/ca/ca-key.pem -config=/ssl/ca-config.json -profile=client - | cfssljson -bare client
mkdir /ssl/data/development/cluster
mv *.pem /ssl/data/development/cluster
rm *.csr

# Production secrets
mkdir /ssl/data/production
## Qold CA
cfssl gencert -initca /ssl/ca-csr.json | cfssljson -bare ca -
mkdir /ssl/data/production/ca
mv *.pem /ssl/data/production/ca
rm *.csr
## RabbitMQ server credentials
echo '{"CN":"cloud.qold.co","hosts":["cloud.qold.co, kube-minion01.cloud.qold.co, kube-minion02.cloud.qold.co, rabbitmq"],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/data/production/ca/ca.pem -ca-key=/ssl/data/production/ca/ca-key.pem -config=/ssl/ca-config.json -profile=server -hostname="cloud.qold.co, kube-minion01.cloud.qold.co, kube-minion02.cloud.qold.co, rabbitmq" - | cfssljson -bare server
mkdir /ssl/data/production/rabbitmq
mv *.pem /ssl/data/production/rabbitmq
rm *.csr
## RabbitMQ gateway credentials
echo '{"CN":"gateway","hosts":[""],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/data/production/ca/ca.pem -ca-key=/ssl/data/production/ca/ca-key.pem -config=/ssl/ca-config.json -profile=client - | cfssljson -bare client
mkdir /ssl/data/production/gateway
mv *.pem /ssl/data/production/gateway
rm *.csr
## RabbitMQ cluster credentials
echo '{"CN":"cluster","hosts":[""],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/data/production/ca/ca.pem -ca-key=/ssl/data/production/ca/ca-key.pem -config=/ssl/ca-config.json -profile=client - | cfssljson -bare client
mkdir /ssl/data/production/cluster
mv *.pem /ssl/data/production/cluster
rm *.csr

cp secret.sh /ssl/data/
