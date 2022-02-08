# Freeflow dev environment

## Gitea
```bash
cp gitea/example.env gitea/.env
# edit .env file if neccesary
cd gitea && ./build.sh
docker-compose --env-file .env up
```

## Mattermost
```bash
cd mattermost && ./build.sh
docker-compose up
```

Remark: Redirect is https, you will need to replace to http on localhost! Works with certificate and reverse proxy.


## Sozu (proxy)



