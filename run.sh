#!/bin/sh

GAM_DIR=~/.gam
if [[ "$(uname -s)" =~ MINGW(32|64)_NT ]]; then
    # Windows docker machine
    GAM_DIR="/c/Users/$(whoami)/.gam"
fi
docker run -it --rm \
  -v "${GAM_DIR}"/client_secrets.json:/gam/GAM-3.63/src/client_secrets.json \
  -v "${GAM_DIR}"/oauth2service.json:/gam/GAM-3.63/src/oauth2service.json \
  -v "${GAM_DIR}"/oauth2.txt:/gam/GAM-3.63/src/oauth2.txt \
  --name gam \
  jonathandandries/gam $@
