from ubuntu:20.04
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get update && apt-get install -y tzdata 
RUN apt-get update && apt-get install -y  make git apt-transport-https ca-certificates curl software-properties-common build-essential zip xmlsec1 jq

RUN curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
RUN tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz

ENV PATH="/usr/local/go/bin:${PATH}" 
RUN git clone https://github.com/freeflowuniverse/freeflow_teams_frontend.git
RUN git clone https://github.com/freeflowuniverse/freeflow_teams_backend.git


RUN apt install -y nodejs npm

RUN mkdir -p freeflow_teams_frontend/dist
RUN cd freeflow_teams_backend && ln -nfs ../freeflow_teams_frontend/dist client
RUN cd ../freeflow_teams_frontend && make build
RUN cd ../freeflow_teams_backend &&  make build  && make package

