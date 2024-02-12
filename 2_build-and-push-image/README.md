# Build the image using the Dockerfile and push to Docker Hub

## How to build and push docker file to docker hub
- Login docker hub.
- edit tag of image in file `version.conf`
- run `build.sh` for build docker image
- run `push.sh` for push image to docker hub

Build command in file `build.sh`
```
#!/bin/sh
[ ! -f version.conf ] || export $(grep -v '^#' version.conf | xargs)
cd ../1_dockerfile
docker build -t mtla-devops-assignment:$MTLA_TAG .

```

Push command in file `push.sh`
```
#!/bin/sh
[ ! -f version.conf ] || export $(grep -v '^#' version.conf | xargs)
docker tag mtla-devops-assignment:$MTLA_TAG untinosz/mtla-devops-assignment:$MTLA_TAG
docker push untinosz/mtla-devops-assignment:$MTLA_TAG
```

Docker image url: https://hub.docker.com/r/untinosz/mtla-devops-assignment