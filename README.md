# zookeeper
the basic zookeeper image for cluster

base on the jplock/docker-zookeeper

1. please make sure the docker images is download in each server.

#deploy steps

the steps should be execute in each host that you deploy the zookeeper container.

1.download files from https://github.com/CommNA/zookeeper

2.modify the server ipaddress of zookeeper node host in config/zoo.cfg

3.execute the deploy_node.sh "sudo sh deploy_node.sh",input the index of the current zookeeper node.

4."sudo docker ps",the current container should be in the container list. 