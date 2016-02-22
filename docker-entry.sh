#!/bin/sh

mkdir -p /mattermost/web/static/js

echo starting platform
/mattermost/bin/platform -config=/config_docker.json
