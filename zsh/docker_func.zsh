#!/bin/bash

#
# Helper Functions (Source: https://github.com/jessfraz/dotfiles)
#
del_stopped(){
	local name=$1
	local state
	state=$(docker inspect --format "{{.State.Running}}" "$name" 2>/dev/null)

	if [[ "$state" == "false" ]]; then
		docker rm "$name"
	fi
}

#
# Default variables
#
export DEFAULT_ADMIN_USER=admin
export DEFAULT_ADMIN_PW=admin

#
# Dockerized Apps
#
mongodb(){
	del_stopped mongodb

	docker run -d \
		-p 27017:27017 \
		-v ~/dev/docker/persistent/mongodb:/data/db \
		-e MONGO_INITDB_ROOT_USERNAME=$DEFAULT_ADMIN_USER \
		-e MONGO_INITDB_ROOT_PASSWORD=$DEFAULT_ADMIN_PW \
		--name mongodb \
		mongo
}

couchdb(){
	del_stopped couchdb
	echo "Starting couchdb"
	docker run -d \
		-p 5984:5984 \
		-v ~/dev/docker/persistent/couchdb/data:/opt/couchdb/data \
		-e COUCHDB_USER=$DEFAULT_ADMIN_USER \
		-e COUCHDB_PASSWORD=$DEFAULT_ADMIN_PW \
		--name couchdb \
		couchdb
}

postgres(){
	del_stopped postgres

	docker run -d \
		-p 5432:5432 \
		-e POSTGRES_PASSWORD=$DEFAULT_ADMIN_PW \
		--name postgres \
		postgres:alpine
}

rabbitmq(){
	del_stopped rabbitmq
	
	docker run -d \
	-p 5671:5671 \
	-p 5672:5672 \
	-p 25672:25672 \
	--hostname my-rabbit \
	--name rabbitmq \
	rabbitmq:3-alpine
}

swaggerui(){
	del_stopped swaggerui

	docker run -d \
	-p 8090:8080 \
	--name swaggerui \
	swaggerapi/swagger-ui
}

dgraph(){
	del_stopped dgraph

	docker run -d \
	-p 8000:8000 \
	-p 8080:8080 \
	-p 9080:9080 \
	--name dgraph \
	dgraph/standalone:latest
}

rstudio(){
  del_stop rstudio

  docker run -d \
  -p 8787:8787 \
  -e PASSWORD=foo \
  -e ROOT=TRUE \
  --name rstudio \
  torkar/docker_bda
}
