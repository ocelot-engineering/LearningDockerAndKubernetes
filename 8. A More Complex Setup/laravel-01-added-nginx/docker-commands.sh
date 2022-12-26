docker-compose run --rm composer create-project --prefer-dist laravel/laravel . # set up laravel project

docker-compose up -d --build server # --build forces docker compose to rebuild images if there are changes
docker-compose run --rm artisan migrate