#!/bin/bash

UI=$(cat .running-ui)
if [ -z "$UI" ] ; then
  UI=auto
fi
docker compose --profile $UI down
