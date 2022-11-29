# 1. Create network which all 3 containers will be in
docker network create goals-net
docker network ls # confirm creation

# 2. Dockerise Mongo DB and ensure data persists
# add user and (bad) password require credentials to login
# docs for connection: https://www.mongodb.com/docs/manual/reference/connection-string/
# docs for image and named volume: https://hub.docker.com/_/mongo
docker run --name mongodb --network goals-net --rm -d -v data:/data/db -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=open_secret mongo
docker ps # check container is running

# 3. Dockerise backend and ensure logs exists and source code is updated live (i.e. changes in source don't require image rebuild)
# update package.json to state the main script so we can use "npm run"
# create Dockerfile from node image and expose port 80
# update app.js to no longer hardcode port and use environment variable from docker "process.env.PORT" instead
# add named volume to store logs "-v feedback:/app/feedback"
# set bind mount -v "$(pwd):/app:ro" to read app code
# set anonymous volume for node_modules by /app/node_modules, to prevent the live code overwrite
# create anonymous volume to overwrite node_modules directory
# chmod -R 775 backend # grant permission to live update code
cd backend
# update localhost to host.docker.internal for localhost, but given it's running in network update with container name 
docker build -t goals-backend . # build image
docker image ps
docker run --rm -d --name goals-backend --network goals-net -e MONGODB_PASSWORD=open_secret -p 80:80 -v logs:/app/logs -v "$(pwd):/app:ro" -v /app/node_modules goals-backend:latest

# 4. Dockerise frontend with live source code update
# Publish on port 3000 to see the fontend
# add -it to run in interactive mode
# Could update all the localhost mentions in app.js to goals-backend since it is running in a network, but this wont work
#  given react code is running in the browser rather than within the container. 
# Also, it doesn't make sense to run the frontend in the docker network since the code of a react application is run browser
#  side rather than server side. Therefore we should pubish the ports of the backend so the frontend can interact with it
cd ../frontend
docker build -t goals-frontend .
docker run -it --rm -d --name goals-frontend -p 3000:3000 -v "$(pwd)/src:/app/src:ro" goals-frontend:latest
