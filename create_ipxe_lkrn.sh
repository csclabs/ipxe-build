#!/bin/bash

docker run -d --cidfile="ipxe-containerid" --name ipxe-build jcpowermac/ipxe-build

RUNNING=$(docker inspect --format="{{ .State.Running }}" $(cat ipxe-containerid))

while true; do 
	sleep 10
	RUNNING=$(docker inspect --format="{{ .State.Running }}" $(cat ipxe-containerid))
	if [ "$RUNNING" == "false" ]; then
	  docker cp $(cat ipxe-containerid):/home/ipxe/src/bin/ipxe.lkrn .
	  docker cp $(cat ipxe-containerid):/home/ipxe/src/bin/undionly.kpxe . 
	  exit 0
	fi
done

docker rm $(cat ipxe-containerid)
rm ipxe-containerid
