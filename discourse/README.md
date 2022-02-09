
cd discourse && ./build.sh

# add discourse.staging.jimber.io to /etc/hosts
sudo -- sh -c 127.0.0.1 discourse.staging.jimber.io" >> /etc/hosts
# edit container vars if nessecary in docker-compose file
vim docker-compose.yaml
# start container
docker-compose up

