#!/bin/bash

echo "Stopping Portainer..."
docker stop portainer

echo "Removing old Portainer container..."
docker rm portainer

echo "Pulling latest Portainer image..."
docker pull portainer/portainer-ce:latest

echo "Starting new Portainer container..."
docker run -d -p 8000:8000 -p 9443:9443 \
  --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:latest

echo "Portainer has been updated!"
