#!/bin/bash

git clone https://github.com/freeflowuniverse/freeflow_git.git gitea_src || true

cd gitea_src && docker build . -t local-gitea

docker network create proxy || true