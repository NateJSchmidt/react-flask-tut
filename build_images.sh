#!/bin/bash

set -e

if [[ -d ./bundle ]]; then
   rm -rf bundle
fi

mkdir -p bundle/images

# generate the ssl certificates for TLS
pushd certs
   rm -f *.pem
   ./generate_certs.sh
popd

# build the nginx server image
docker image build -t nginx_server:local -f nginx/Dockerfile .
docker save nginx_server:local -o ./bundle/images/nginx_server.tar

# build the flask+uwsgi image
docker image build -t flask_api_service:local -f uwsgi/Dockerfile .
docker save flask_api_service:local -o ./bundle/images/flask_api_service.tar

# bundle everything together with docker-compose file
tar -czvf bundle/build.tar.gz docker-compose.yml -C bundle/images .
