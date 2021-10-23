#! /bin/bash

if [ `id -nG | grep -c docker` -eq 0 ]
then
    echo "Docker deamon unaccessible!"
    exit 0
fi

docker ps -a | grep rippled &> /dev/null
if [ $? -eq 0 ]
then
    echo -e "Removing old image...\n"
    docker rmi rippled -f
fi

# Creating new image
docker build -t rippled .

# Refreshing all pods
kubectl delete -f ripple-setup.yaml
kubectl apply -f ripple-setup.yaml
