docker build -t node-util .

docker run -it -v "$(pwd):/app" node-util npm init # without entry point

docker run -it -v "$(pwd):/app" node-util init # with entry point

docker compose run --rm npm init # using docker compose
