# To make your builds reproducible, make sure you lock down to a specific
# version, not to `latest`! 
FROM frolvlad/alpine-glibc:alpine-3.3_glibc-2.23
MAINTAINER "Jonathan D'Andries" <jonathan.dandries@wiwd.uscourts.gov>

RUN apk add --no-cache --virtual=build-dependencies \
    bash \
    python \
    curl \
    ca-certificates \
    tar

RUN mkdir /gam \
  && curl -L https://github.com/jay0lee/GAM/archive/v3.63.tar.gz | tar -zxC /gam \
  && touch /gam/GAM-3.63/src/nobrowser.txt \
  && chmod -R 777 /gam \
  && echo 'python /gam/GAM-3.63/src/gam.py $@' > /usr/bin/gam \
  && chmod 777 /usr/bin/gam


#ENTRYPOINT exec bash -c "source $HOME/.bashrc ; \
#/usr/bin/cssh $CSSH_CLUSTER"
ENTRYPOINT bash
