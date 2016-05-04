#!/usr/bin/env bash

# Create RabbitMQ development credentials
echo '{"CN":"cloud.qold.co","hosts":["cloud.qold.co, kube-minion01.cloud.qold.co, kube-minion02.cloud.qold.co, rabbitmq-dev"],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/data/development/ca/ca.pem -ca-key=/ssl/data/development/ca/ca-key.pem -config=/ssl/config/ca-config.json -profile=server -hostname="cloud.qold.co, kube-minion01.cloud.qold.co, kube-minion02.cloud.qold.co, rabbitmq-dev" - | cfssljson -bare server
mv *.pem /ssl/data/development/server
rm *.csr
# Create RabbitMQ production credentials
echo '{"CN":"cloud.qold.co","hosts":["cloud.qold.co, kube-minion01.cloud.qold.co, kube-minion02.cloud.qold.co, rabbitmq"],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/data/production/ca/ca.pem -ca-key=/ssl/data/production/ca/ca-key.pem -config=/ssl/config/ca-config.json -profile=server -hostname="cloud.qold.co, kube-minion01.cloud.qold.co, kube-minion02.cloud.qold.co, rabbitmq" - | cfssljson -bare server
mv *.pem /ssl/data/production/server
rm *.csr
