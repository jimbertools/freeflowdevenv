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
 * **Edit DISCOURSE_SMTP_PASSWORD="valid smtp password" in the docker-compose file**
 * Add discourse.staging.jimber.io to /etc/hosts
```
sudo -- sh -c 127.0.0.1 discourse.staging.jimber.io" >> /etc/hosts
cd discourse && ./build.sh
docker-compose up
```
 * Connect to http://discourse.staging.jimber.io





## Sozu (proxy)

#### Install sozu
`cargo install sozu --vers=0.12.0 --features use-openssl`

#### App configuration
Sozu repo is incompatible with latest version of openssl.
We have disabled the check at compilation and so far everything works fine on latest openssl v1.1.1
Forked Sozu repo can be found at: [Jimbertools](https://github.com/jimbertools/sozu.git)

** Put the correct certs into the certs folder **
** manual setup required to point to internal ip's of backend services **
* TODO use dns to proxy services (blocked by sozu syntax)

Add backend ips to the sozu/config.toml.
*this is also possible in runtime using the sozuctl*

### Run sozu



```bash
cd sozu && docker build -t proxy .
docker-compose up 
```

