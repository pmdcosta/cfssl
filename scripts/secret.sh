#!/usr/bin/env bash

# Development secrets
## Qold CA
kubectl create secret generic qold-ssl-ca-cer-dev --from-file=development/ca/ca.pem
kubectl create secret generic qold-ssl-ca-key-dev --from-file=development/ca/ca-key.pem --from-file=development/ca/ca.pem
## RabbitMQ server credentials
kubectl create secret generic rabbitmq-ssl-server-dev --from-file=development/server/server.pem --from-file=development/server/server-key.pem
## RabbitMQ client credentials
kubectl create secret generic rabbitmq-ssl-client-dev --from-file=development/cluster/client.pem --from-file=development/cluster/client-key.pem
## RabbitMQ gateway credentials
kubectl create secret generic rabbitmq-ssl-gateway-dev --from-file=development/gateway/client.pem --from-file=development/gateway/client-key.pem

# Production secrets
## Qold CA
kubectl create secret generic qold-ssl-ca-cer --from-file=production/ca/ca.pem
kubectl create secret generic qold-ssl-ca-key --from-file=production/ca/ca-key.pem --from-file=production/ca/ca.pem
## RabbitMQ server credentials
kubectl create secret generic rabbitmq-ssl-server --from-file=production/server/server.pem --from-file=production/server/server-key.pem
## RabbitMQ client credentials
kubectl create secret generic rabbitmq-ssl-client --from-file=production/cluster/client.pem --from-file=production/cluster/client-key.pem
## RabbitMQ gateway credentials
kubectl create secret generic rabbitmq-ssl-gateway --from-file=production/gateway/client.pem --from-file=production/gateway/client-key.pem
