#!/usr/bin/env bash

cfssl gencert -initca ca-csr.json | cfssljson -bare ca -
mkdir ca
mv *.pem ca
rm *.csr

echo '{"CN":"cloud.qold.co","hosts":["cloud.qold.co, kube-minion01.cloud.qold.co, kube-minion02.cloud.qold.co, rabbitmq"],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/ca/ca.pem -ca-key=/ssl/ca/ca-key.pem -config=/ssl/ca-config.json -profile=server -hostname="cloud.qold.co, kube-minion01.cloud.qold.co, kube-minion02.cloud.qold.co, rabbitmq" - | cfssljson -bare server
mkdir rabbitmq
mv *.pem server
rm *.csr

echo '{"CN":"gateway","hosts":[""],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/ca/ca.pem -ca-key=/ssl/ca/ca-key.pem -config=/ssl/ca-config.json -profile=client - | cfssljson -bare client
mkdir gateway
mv *.pem gateway
rm *.csr

echo '{"CN":"gateway","hosts":[""],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/ca/ca.pem -ca-key=/ssl/ca/ca-key.pem -config=/ssl/ca-config.json -profile=client - | cfssljson -bare client
mkdir cluster
mv *.pem cluster
rm *.csr