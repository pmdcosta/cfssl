# CFSSL
CFSSL is a TLS/SSL certificate chain creation application developed and used at CloudFlare.

The docker container created by this repository is intended to be used to create/setup the SSL environment for the Qold project.
By running the container as: `docker run -it --rm -v path/to/dir:/ssl/data pmdcosta/cfssl` a directory with the keys/certs needed to deploy the qold project, along with a `secret.sh` script that will deploy them to kubernetes will be created.

The container and operations are based on the guide provided by [CoreOS](https://coreos.com/os/docs/latest/generate-self-signed-certificates.html)