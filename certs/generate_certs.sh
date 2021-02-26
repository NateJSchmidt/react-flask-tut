#!/bin/bash

# look up local hostname
my_ip=$(hostname -I | cut -d' ' -f1)

# generate private key.pem file and public cert.pem file
openssl req -x509 -newkey rsa:4096 -nodes -keyout key.pem -out cert.pem -days 365 -subj "/C=/ST=/L=/O=/CN=${my_ip}"
