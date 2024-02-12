#!/bin/sh
[ ! -f version.conf ] || export $(grep -v '^#' version.conf | xargs)
cd ../1_dockerfile
docker build -t mtla-devops-assignment:$MTLA_TAG .
