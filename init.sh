#!/bin/sh
set -e
if [ ! -f config/config_local.json ]; then
 [ -z "$mode" ] && echo "Container mode must be specified or config_local.json should be mounted" && exit
 cp "/config.json.$mode" config/config_local.json
 [ ! -z "$key" ] && jq ".[keys_unsorted | last][0].key = \"$key\"" config/config_local.json > config/config_local.json.tmp && mv config/config_local.json.tmp config/config_local.json
 [ ! -z "$secretKey" ] && jq ".[keys_unsorted | last][0].secretKey = \"$secretKey\"" config/config_local.json > config/config_local.json.tmp && mv config/config_local.json.tmp config/config_local.json
 [ ! -z "$region" ] && jq ".[keys_unsorted | last][0].region = \"$region\"" config/config_local.json > config/config_local.json.tmp && mv config/config_local.json.tmp config/config_local.json
 [ ! -z "$url" ] && jq ".[keys_unsorted | last][0].url = \"$url\"" config/config_local.json > config/config_local.json.tmp && mv config/config_local.json.tmp config/config_local.json
 [ ! -z "$visibility" ] && jq ".[keys_unsorted | last][0].visibility = \"$visibility\"" config/config_local.json > config/config_local.json.tmp && mv config/config_local.json.tmp config/config_local.json
fi
yarn start
