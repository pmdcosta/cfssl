# Qold CA
kubectl create secret generic qold-ca --from-file=~/secrets/ca/ca.pem
kubectl create secret generic qold-ca-key --from-file=~/secrets/ca/ca-key.pem --from-file=~/secrets/ca/ca.pem
