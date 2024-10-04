#!/bin/bash

if [ ! -d /etc/letsencrypt/live/$ServerFqdn ]; then

    if [[ "${LE_STAGING}" == True ]]; then
        certbot certonly --standalone --email ${LE_Email} -d ${ServerFqdn} --rsa-key-size ${LE_RsaKeySize} --agree-tos --non-interactive --test-cert
    else
        certbot certonly --standalone --email ${LE_Email} -d ${ServerFqdn} --rsa-key-size ${LE_RsaKeySize} --agree-tos --non-interactive
    fi
fi
