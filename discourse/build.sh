
  
#!/bin/bash

#git clone https://github.com/freeflowuniverse/freeflow_git.git gitea_src || true
git clone -b fix-discourse https://github.com/threefoldtech/tf-images.git || true


cd tf-images/tfgrid2/discourse_all_in_one && docker build . -t local-discourse

docker network create proxy || true
