#!/usr/bin/env bash

# Development secrets
## Qold CA
kubectl create secret generic qold-ca-dev --from-file=development/ca/ca.pem
kubectl create secret generic qold-ca-key-dev --from-file=development/ca/ca-key.pem --from-file=development/ca/ca.pem
## RabbitMQ server credentials
kubectl create secret generic rabbitmq-server-ssl-dev --from-file=development/rabbitmq/server.pem --from-file=development/rabbitmq/server-key.pem
## RabbitMQ cluster credentials
kubectl create secret generic rabbitmq-cluster-ssl-dev --from-file=development/cluster/client.pem --from-file=development/cluster/client-key.pem
## RabbitMQ gateway credentials
kubectl create secret generic rabbitmq-gateway-ssl-dev --from-file=development/gateway/client.pem --from-file=development/gateway/client-key.pem

# Production secrets
## Qold CA
kubectl create secret generic qold-ca --from-file=production/ca/ca.pem
kubectl create secret generic qold-ca-key --from-file=production/ca/ca-key.pem --from-file=production/ca/ca.pem
## RabbitMQ server credentials
kubectl create secret generic rabbitmq-server-ssl --from-file=production/rabbitmq/server.pem --from-file=production/rabbitmq/server-key.pem
## RabbitMQ cluster credentials
kubectl create secret generic rabbitmq-cluster-ssl --from-file=production/cluster/client.pem --from-file=production/cluster/client-key.pem
## RabbitMQ gateway credentials
kubectl create secret generic rabbitmq-gateway-ssl --from-file=production/gateway/client.pem --from-file=production/gateway/client-key.pem
