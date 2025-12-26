#!/bin/bash
docker pull 060152177661.dkr.ecr.ap-northeast-1.amazonaws.com/sample-web-app:$(CODEBUILD_RESOLVED_SOURCE_VERSION)

docker stop web-app || true
docker rm web-app || true

docker run -d \
  --name web-app \
  -p 3000:3000 \
  060152177661.dkr.ecr.ap-northeast-1.amazonaws.com/sample-web-app:$(CODEBUILD_RESOLVED_SOURCE_VERSION)
