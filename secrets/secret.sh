#!/usr/bin/env bash

# Qold CA
kubectl create secret generic qold-ca --from-file=ca.pem
sudo kubectl create secret generic qold-ca-key --from-file=ca-key.pem --from-file=ca.pem
