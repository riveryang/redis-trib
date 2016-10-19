#!/bin/sh

docker run -it \
-e NODES="\
192.168.8.158:7000 \
192.168.8.158:7001 \
192.168.8.158:7002 \
192.168.8.158:7003 \
192.168.8.158:7004 \
192.168.8.158:7005\
" \
-e REPLICAS=1 \
riveryang/redis-trib create
