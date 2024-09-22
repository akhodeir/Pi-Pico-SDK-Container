docker run -d -it --name pico-sdk-cd --mount type=bind,source=${PWD},target=/home/dev pico-sdk:latest

docker exec -it pico-sdk-cd /bin/bash
