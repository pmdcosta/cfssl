#!/usr/bin/env bash

# Create development CA
cfssl gencert -initca /ssl/config/ca-csr.json | cfssljson -bare ca -
mv *.pem /ssl/data/development/ca
rm *.csr
# Create production CA
cfssl gencert -initca /ssl/config/ca-csr.json | cfssljson -bare ca -
mv *.pem /ssl/data/production/ca
rm *.csr
