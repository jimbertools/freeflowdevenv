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

*Remark: Redirect is https, you will need to replace to http on localhost! Works with certificate and reverse proxy.*


## Sozu (proxy)
Add backend ips to the [config.toml](sozu/config.toml).
*this is also possible in runtime using the sozuctl*

### Run sozu

```bash
cd sozu
sudo sozu start --config config.toml 
```
### https 
ToDo
