# 1. Create network which all 3 containers will be in
docker network create goals-net
docker network ls # confirm creation

# 2. Dockerise Mongo DB and ensure data persists
docker run --name mongodb --network goals-net --rm -d mongo
docker ps # check container is running

# 3. Dockerise backend and ensure logs exists and source code is updated live (i.e. changes in source don't require image rebuild)
# update package.json to state the main script so we can use "npm run"
# create Dockerfile from node image and expose port 80
# update app.js to no longer hardcode port and use environment variable from docker "process.env.PORT" instead
# add named volume to store logs "-v feedback:/app/feedback"
# set bind mount -v "$(pwd):/app:ro" to read app code
# create anonymous volume to overwrite node_modules directory
cd backend
docker build -t goals-backend . # build image
docker image ps
docker run --rm -d --name goals-backend --network goals-net -p 80:80 --env PORT=80 -v logs:/app/logs -v "$(pwd):/app:ro" -v /app/node_modules  goals-backend:latest

# 4. Dockerise frontend with live source code update
cd ..
