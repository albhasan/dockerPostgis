#!/bin/bash
docker stop postgis1
docker rm postgis1
docker rmi postgis_img

#docker build --rm=true --tag="postgis_img" .
docker build  --tag="postgis_img" .

docker run -d --name="postgis1" -p 48901:48901 -p 48902:48902 --expose=5432 postgis_img
docker ps
#rm ~/.ssh/known_hosts
#ssh -p 48901 root@localhost
