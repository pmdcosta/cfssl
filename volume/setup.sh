mkdir ca
mkdir server
mkdir client

cfssl gencert -initca ca-csr.json | cfssljson -bare ca -
mv *.pem ca
rm *.csr

echo '{"CN":"rabbitmq.qold.co","hosts":["rabbitmq.qold.co,rabbit.qold.co,cloud.qold.co,rabbitmq"],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/ca/ca.pem -ca-key=/ssl/ca/ca-key.pem -config=/ssl/ca-config.json -profile=server -hostname="rabbitmq.qold.co,rabbit.qold.co,cloud.qold.co,rabbitmq" - | cfssljson -bare server
mv *.pem server
rm *.csr

echo '{"CN":"gateway","hosts":[""],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=/ssl/ca/ca.pem -ca-key=/ssl/ca/ca-key.pem -config=/ssl/ca-config.json -profile=client - | cfssljson -bare client
mv *.pem client
rm *.csr
