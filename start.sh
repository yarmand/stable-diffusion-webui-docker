#!/bin/bash

UI=auto

function usage() {
  echo "Usage: $0 [-port PORT] [UI] "
  echo "  UI: auto, invoke, sygil, comfy"
}


while [ -n "$1" ] ; do
  case $1 in
    -h|--help)
      usage
      exit 0
      ;;
    -port)
      shift
      export WEBUI_PORT=$1
      ;;
    *)
      UI=$1
      ;;
  esac
  shift
done

echo -n $UI >.running-ui
docker compose --profile $UI up --build --remove-orphans
