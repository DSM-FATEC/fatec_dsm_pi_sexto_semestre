#!/bin/bash
set -x #echo on

VERSAO=1.3
IMAGEM="guia-me-apicruds:v$VERSAO"
REGISTRY="southamerica-east1-docker.pkg.dev/guiame-mobile/imagens/$IMAGEM"

gcloud auth configure-docker southamerica-east1-docker.pkg.dev
docker build . -f ./deploy/prod/Dockerfile.apicruds -t "$IMAGEM" --platform linux/amd64
docker tag $IMAGEM $REGISTRY
docker push $REGISTRY
