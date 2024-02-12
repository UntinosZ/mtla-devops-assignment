#!/bin/sh
[ ! -f version.conf ] || export $(grep -v '^#' version.conf | xargs)
docker tag mtla-devops-assignment:$MTLA_TAG untinosz/mtla-devops-assignment:$MTLA_TAG
docker push untinosz/mtla-devops-assignment:$MTLA_TAG
