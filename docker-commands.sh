# basics
docker build .
docker image ls # list all images
docker run -p 3000:3000 <image>
docker ps # see running processes
docker stop

# build
docker build -t goals:latest . # builds the the image with the name goals and tag latest

# run
docker run <image name>     # runs container based on node image. Will download if not available locally
docker run -it <imagen ame> # -it means "interactive", so it will open a expose a container with a node session
docker run --name <image hash> # assigns a custom name to a container
docker run -d # run in detached mode
docker run -p 3000:80 # run and publish port 80 on port 3000
docker run --rm # remove container when it stops
docker run -v <volume name>:<volume path> # create named volume and make accessible to container
docker run -p 3000:80 --name feedback-app --rm -d -v feedback:/app/feedback feedback:volumes
docker run <container name> --network <network name> # run container in network

# Example of docker run
docker run -d --rm -p 3000:80 --name feedback-app --env PORT=80 -v feedback:/app/feedback -v "$(pwd):/app:ro" -v /app/node_modules -v /app/temp feedback:env 
-d                        # run detached so console is free
--rm                      # delete container after shutdown
-p 3000:80                # publish port 80 on port 3000 of host
--name feedback-app       # name container "feedback-app"
--env PORT=80             # set environment variable PORT to 80
-v feedback:/app/feedback # named volume "feedback" set at path /app/feedback
-v "$(pwd):/app:ro"       # set bind mount. Map working drive to /app in container and make it ro (with :ro) 
-v /app/node_modules      # create anonymous volume /app/node_modules (overwrites bind mount for node_modules)
-v /app/temp              # create anonymous volume /app/temp (overwrites bind mount for temp)
feedback:env              # run from image REPO=feedback, TAG=env

# volumes
docker volume ls # list all volumes
docker volume rm <volume name> # delete a volume
docker volume prune # delete all unused volumes
docker volume inspect <vol name> # look at details such as read only, create date, etc

# networks
docker network create <network-name> # create docker network
host.docker.internal # resolves ip to localhost

# compose
docker compose up
-d # detached mode
docker compose down
-v deletes volumes with docker compose down

# other
docker start <name> # restarts a container
docker start -ai <name> # restarts a container and makes it interactive and attaches
docker logs <name> # allows us to see the outputs of an deattached container
docker attach <container> # attaches an already runnning container
docker rm <name> # removes container
docker rmi <imageid> # removes images
docker image prune # removes all unused images (no container relaying on it)
docker cp <source> <dest> # copies files or directories to and from running docker containers
docker logs <container>

