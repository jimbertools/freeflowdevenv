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

## Discourse
 * Build discourse
```cd discourse && ./build.sh```

 * Add discourse.staging.jimber.io to /etc/hosts
```sudo -- sh -c 127.0.0.1 discourse.staging.jimber.io" >> /etc/hosts```
 * **Edit DISCOURSE_SMTP_PASSWORD="valid smtp password" in the docker-compose file**
```vim docker-compose.yaml```
 * Start container
```docker-compose up```
 * Connect to http://discourse.staging.jimber.io





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
