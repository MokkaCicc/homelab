#!/bin/sh
docker volume create portainer_data
docker network create lan \
	-d macvlan \
	--subnet=192.168.0.0/24 \
	--gateway=192.168.0.254 \
	-o parent=enp3s0
docker run -d \
	--name portainer \
	--restart=always \
	--network=lan \
	--ip=192.168.0.101 \
	-p 9000:9000 \
	-p 8000:8000 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v portainer_data:/data portainer/portainer-ce:latest
