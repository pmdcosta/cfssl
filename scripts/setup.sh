#!/usr/bin/env bash

echo ">> Creating directories"
mkdir -p /ssl/data/development/ca
mkdir -p /ssl/data/development/server
mkdir -p /ssl/data/development/cluster
mkdir -p /ssl/data/development/gateway
mkdir -p /ssl/data/production/ca
mkdir -p /ssl/data/production/server
mkdir -p /ssl/data/production/cluster
mkdir -p /ssl/data/production/gateway
cp /ssl/scripts/secret.sh /ssl/data/secret.sh
echo ">> Creating CA"
/ssl/scripts/create_ca.sh
echo ">> Creating Server"
/ssl/scripts/create_server.sh
echo ">> Creating Cluster"
/ssl/scripts/create_cluster.sh
echo ">> Changing permissions"
chmod -R +r *
echo ">> Done"
