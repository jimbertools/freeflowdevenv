Sozu repo is incompatible with latest version of openssl.
We have disabled the check at compilation and so far everything works fine on latest openssl v1.1.1
Forked Sozu repo can be found at: [Jimbertools](https://github.com/jimbertools/sozu.git)

Put the correct certs into the certs folder

build docker image
docker build -t proxy .

** manual setup required to point to internal ip's of backend services **
* TODO use dns to proxy services (blocked by sozu syntax)

start proxy container
docker-compose up 
