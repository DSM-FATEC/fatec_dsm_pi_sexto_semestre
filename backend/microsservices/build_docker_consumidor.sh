#!/bin/bash
set -x #echo on

VERSAO=1
IMAGEM="guia-me-consumidor:v$VERSAO"
REGISTRY="southamerica-east1-docker.pkg.dev/guiame-mobile/imagens/$IMAGEM"

gcloud auth configure-docker southamerica-east1-docker.pkg.dev
docker build . -f ./deploy/prod/Dockerfile.consumidor -t "$IMAGEM" --platform linux/amd64
docker tag $IMAGEM $REGISTRY
docker push $REGISTRY
