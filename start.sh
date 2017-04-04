#!/bin/bash
file="tmp/pids/server.pid"
if [ -f "$file" ]
then
	sudo rm $file 
fi
docker-compose up