# Qold CA
kubectl create secret generic qold-ca --from-file=../volume/ca/ca.pem
sudo kubectl create secret generic qold-ca-key --from-file=../volume/ca/ca-key.pem --from-file=../volume/ca/ca.pem
