#!/bin/bash

#
# Helper Functions (Source: https://github.com/jessfraz/dotfiles)
#
dcleanup(){
	local containers
	mapfile -t containers < <(docker ps -aq 2>/dev/null)
	docker rm "${containers[@]}" 2>/dev/null
	local volumes
	mapfile -t volumes < <(docker ps --filter status=exited -q 2>/dev/null)
	docker rm -v "${volumes[@]}" 2>/dev/null
	local images
	mapfile -t images < <(docker images --filter dangling=true -q 2>/dev/null)
	docker rmi "${images[@]}" 2>/dev/null
}
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
	del_stopped couchdb

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
