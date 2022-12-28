sudo yum update -y

sudo amazon-linux-extras install docker

sudo service docker start

sudo docker run -d --rm -p 80:80 docker-hub-repo/node-example-1
