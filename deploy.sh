#!/bin/bash
DOCKERHUB_USER=steviebhoy
APP_NAME=lbg-api-app

# build image
docker rmi -f ${DOCKERHUB_USER}/${APP_NAME}
docker build -t ${DOCKERHUB_USER}/${APP_NAME} .

# push to dockerhub
docker push ${DOCKERHUB_USER}/${APP_NAME}

# run container from the image
docker rm -f ${APP_NAME}
docker run -d -p 80:4000 --name ${APP_NAME} ${DOCKERHUB_USER}/${APP_NAME}

docker system prune -f
