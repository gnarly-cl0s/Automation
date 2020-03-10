FROM alpine:latest
MAINTAINER Gnarly-Cl0s
LABEL Name=nmap-scanner Version=1.0 
RUN apk add --update --no-cache \
    curl \
    nc \
    nmap \ 
    vim && rm -rf /var/cache/apk/*
VOLUME /data
WORKDIR /data

ENTRYPOINT ["nmap"]
