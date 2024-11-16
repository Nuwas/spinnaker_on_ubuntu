#!/bin/bash

# env flags that need to be set:
CLIENT_ID=Ov23liCML30mwa9QtxeC
CLIENT_SECRET=fe3aadb7bc4d3c6074811f1d2da9a0cf7f98c360
PROVIDER=github
REDIRECT_URI=http://51.20.72.80:8084/login

set -e

if [ -z "${CLIENT_ID}" ] ; then
  echo "CLIENT_ID not set"
  exit
fi
if [ -z "${CLIENT_SECRET}" ] ; then
  echo "CLIENT_SECRET not set"
  exit
fi
if [ -z "${PROVIDER}" ] ; then
  echo "PROVIDER not set"
  exit
fi
if [ -z "${REDIRECT_URI}" ] ; then
  echo "REDIRECT_URI not set"
  exit
fi

#MY_IP=`curl -s ifconfig.co`
MY_IP=51.20.72.80

hal config security authn oauth2 edit \
  --client-id $CLIENT_ID \
  --client-secret $CLIENT_SECRET \
  --provider $PROVIDER
hal config security authn oauth2 enable

hal config security authn oauth2 edit --pre-established-redirect-uri $REDIRECT_URI

hal config security ui edit \
    --override-base-url http://${MY_IP}:9000

hal config security api edit \
    --override-base-url http://${MY_IP}:8084
                                                 