#!/bin/bash

for network in $(sudo docker network ls | awk '{print $2}'); do
	
	echo $network &&  sudo docker network inspect $network | grep "IPv4Address" 
	printf "\n"

done
