#!/bin/sh
docker volume create portainer_data
docker run -d \
	--name portainer \
	--restart=always \
	-p 9000:9000 \
	-p 8000:8000 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v portainer_data:/data portainer/portainer-ce:latest
