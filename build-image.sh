#!bin/bash

git clone https://github.com/esl/mongooseim-docker.git .
VOLUMES=`pwd`
docker run -d --name mongooseim-builder -h mongooseim-builder -v ${VOLUMES}/builds:/builds mongooseim/mongooseim-builder
docker exec -i mongooseim-builder /build.sh
cp builds/mongooseim* member/mongooseim.tar.gz
docker build -f Dockerfile.member -t mongooseim .
docker images