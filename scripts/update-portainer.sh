#!/bin/sh
echo -n "Enter the portainer IP address (eg: 192.168.0.10): "
read ip
echo -n "Enter the portainer MAC address (eg: BE-E8-C1-64-57-30): "
read mac

docker stop portainer
docker rm portainer
docker run -d \
	--name portainer \
	--restart=always \
	--network=lan \
	--ip=$ip \
	--mac-address=$mac \
	-p 9000:9000 \
	-p 8000:8000 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v portainer_data:/data portainer/portainer-ce:latest
