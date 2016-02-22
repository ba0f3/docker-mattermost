# Copyright (c) 2015 Mattermost, Inc. All Rights Reserved.
# See License.txt for license information.
FROM ubuntu:14.04

# Copy over files
ADD https://github.com/mattermost/platform/releases/download/v2.0.0/mattermost.tar.gz /
RUN tar -zxvf /mattermost.tar.gz
RUN rm /mattermost.tar.gz
ADD config_docker.json /
ADD docker-entry.sh /

RUN chmod +x /docker-entry.sh
RUN chmod +x /mattermost/bin/platform
ENTRYPOINT /docker-entry.sh

# Create default storage directory
RUN mkdir /mattermost-data
WORKDIR /mattermost
VOLUME /mattermost-data

# Ports
EXPOSE 80
