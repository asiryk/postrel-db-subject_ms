# build container with no cache
docker-compose build --no-cache

# start iris container
docker-compose up -d

# open iris terminal in docker
docker-compose exec iris iris session iris