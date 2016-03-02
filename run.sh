#!/bin/sh

#  -e DISPLAY=$(docker-machine inspect default --format={{.Driver.HostOnlyCIDR}} | cut -d'/' -f1):0 \

docker run -it --rm \
  -v $(pwd)/client_secrets.json:GAM-3.63/src/client_secrets.json \
  -v $(pwd)/oauth2service.json:GAM-3.63/src/oauth2service.json \
  --name gam \
  repo.cad.ao.dcn/gam
