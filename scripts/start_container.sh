#!/bin/bash

IMAGE_TAG=$(cat /home/ubuntu/deploy/tag.txt)
docker pull 060152177661.dkr.ecr.ap-northeast-1.amazonaws.com/sample-web-app:$IMAGE_TAG

docker stop web-app || true
docker rm web-app || true

docker run -d \
  --name web-app \
  -p 3000:3000 \
  060152177661.dkr.ecr.ap-northeast-1.amazonaws.com/sample-web-app:$IMAGE_TAG
