#!bin/bash

WORKING_DIR_MIM_DB='mongooseim-docker-build' 
mkdir ${WORKING_DIR_MIM_DB}
cd ${WORKING_DIR_MIM_DB}
git clone https://github.com/esl/mongooseim-docker.git .
VOLUMES=${WORKING_DIR_MIM_DB}
docker run -d --name mongooseim-builder -h mongooseim-builder -v ${VOLUMES}/builds:/builds mongooseim/mongooseim-builder
docker exec -i mongooseim-builder /build.sh
cp builds/mongooseim* member/mongooseim.tar.gz
docker build -f Dockerfile.member -t mongooseim .
docker images
