docker run -d -it --name pico-sdk --mount type=bind,source=${PWD},target=/home/dev pico-sdk:latest

docker exec -it pico-sdk /bin/sh