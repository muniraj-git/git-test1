#!/bin/bash

TO="munirajr74@gmail.com pooj792@gmail.com manojdevopstest@gmail.com"
SUBJECT="Docker Service Alert"
current_date=$(date)

#Get Docker status

dockerStatus=$(systemctl is-active docker)
dockerVersion=$(docker -v |awk '{print $3}' | tr -d ',')


#Current Status

echo "Current time is $current_date and the docker status is $dockerStatus"
echo "Current docker version: $dockerVersion"

#if my docker is dead/inactive then send an email


if [ "$dockerStatus" != "active" ]; then
echo -e "Docker is not running on $(hostname) at $current_date\nStatus: $dockerStatus\nDocker Version: $dockerVersion" | mail -s "$SUBJECT - Docker is $dockerStatus" $TO
fi

