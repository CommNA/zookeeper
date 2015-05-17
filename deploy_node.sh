#!/bin/bash
echo "1. please make sure the host ipaddress that in zoo.cfg be modified to your host ip."
echo "2 .please make sure the docker images is download in your local images list." 
read -p "please input the node index:" NODENUM
# copy the zookeeper configure file
mkdir -p /etc/zk/conf 
cp ./conf/* /etc/zk/conf 
# create the zookeeper myid file
mkdir -p /etc/zk/data
touch /etc/zk/data/myid
echo $NODENUM >> /etc/zk/data/myid
# start zookeeper container
sudo docker run -d --name zk0$NODENUM -p 2181:2181 -p 2888:2888 -p 3888:3888 -v /etc/zk/conf:/opt/zookeeper/conf -v /etc/zk/data:/opt/zookeeper/data wangpeng6421/zookeeper

