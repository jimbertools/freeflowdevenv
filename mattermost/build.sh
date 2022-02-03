#!/bin/bash

docker build -f docker-builder.Dockerfile -t mattermostbuild .
id=$(docker run -d mattermostbuild tail -f /dev/null)
docker cp $id:/freeflow_teams_backend/dist/mattermost-team-linux-amd64.tar.gz ./mattermost-team-linux-amd64.tar.gz
docker rm -fv $id

sudo rm -Rf mattermost-docker-mysql && git clone https://github.com/freeflowuniverse/mattermost-docker-mysql

mkdir -p ./volumes/app/mattermost/{data,logs,config,plugins}
sudo chown -R 2000:2000 ./volumes/app/mattermost/


cd mattermost-docker-mysql && cp ../mattermost-team-linux-amd64.tar.gz ./app/
cd app && docker build -t mattermost-docker-mysql_app . && cd ..
cd web && docker build -t mattermost-docker-mysql_web . 
cd ../..
docker network create proxy
