# CFSSL
CFSSL is a TLS/SSL certificate chain creation application developed and used at CloudFlare.

The docker container created by this repository is intended to be used to create/setup the SSL environment for the Qold project.

Run the container locally with `docker run -it --rm -v $PWD:/ssl/data/ pmdcosta/cfssl:latest /ssl/scripts/setup.sh` to create all the secrets necessary to run a qold cluster project. The secrets can be deployed to the kubernetes server using the `secrets.sh `script supplied, assuming the cluster is deployed and local kubectl is properly configured.

The Qold-CFSSL replication controller provides a way to create new gateway ssl credentials. The `new_gateway.sh` script will supply a new key pair of credentials for qold gateways.

The container and operations are based on the guide provided by [CoreOS](https://coreos.com/os/docs/latest/generate-self-signed-certificates.html)