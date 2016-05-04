#!/usr/bin/env bash

CFSSL=$(kubectl get pods | grep cfssl | awk '{ print $1 }')
kubectl exec $CFSSL -- /bin/bash /ssl/scripts/create_gateway.sh
