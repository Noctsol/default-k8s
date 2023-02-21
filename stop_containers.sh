container_ids=$(docker ps -a -q)
docker stop $container_ids