export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"
docker build . -f Dockerfile -t pico-sdk:latest --progress=plain
