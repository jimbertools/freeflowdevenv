#!/bin/bash

[[ -d ./gitea_src ]] || git clone https://github.com/freeflowuniverse/freeflow_git.git gitea_src

cd gitea_src && docker build . -t local-gitea -f all-in-one.Dockerfile

docker network create proxy || true