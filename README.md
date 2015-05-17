# zookeeper
the basic zookeeper image for cluster

base on the jplock/docker-zookeeper

# cluster deployment
sudo mkdir -p /etc/zk01/conf /etc/zk01/data

touch /etc/zk01/data/myid

echo "1" >>  /etc/zk01/data/myid

sudo docker run -d --name zk01 -p 2181:2181 -p 2888:2888 -p 3888:3888 -v /etc/zk01/conf:/opt/zookeeper/conf -v /etc/zk01/data:/opt/zookeeper/data wangpeng6421/zookeeper


sudo mkdir -p /etc/zk02/conf /etc/zk02/data

touch /etc/zk02/data/myid

echo "2" >>  /etc/zk02/data/myid

sudo docker run -d --name zk02 -p 2182:2182 -p 2888:2888 -p 3888:3888 -v /etc/zk02/conf:/opt/zookeeper/conf -v /etc/zk02/data:/opt/zookeeper/data wangpeng6421/zookeeper


sudo mkdir -p /etc/zk03/conf /etc/zk03/data

touch /etc/zk03/data/myid

echo "3" >>  /etc/zk03/data/myid

sudo docker run -d --name zk03 -p 2183:2183 -p 2888:2888 -p 3888:3888 -v /etc/zk03/conf:/opt/zookeeper/conf -v /etc/zk03/data:/opt/zookeeper/data wangpeng6421/zookeeper

# cluster1 configuration file
tickTime=2000

initLimit=10

syncLimit=5

dataDir=/opt/zookeeper/data

dataLogDir=/opt/zookeeper/logs

clientPort=2181

server.1=192.168.11.101:2888:3888

server.2=192.168.11.102:2888:3888

server.3=192.168.11.103:2888:3888

# cluster2 configuration file
tickTime=2000

initLimit=10

syncLimit=5

dataDir=/opt/zookeeper/data

dataLogDir=/opt/zookeeper/logs

clientPort=2182

server.1=192.168.11.101:2888:3888

server.2=192.168.11.102:2888:3888

server.3=192.168.11.103:2888:3888


# cluster3 configuration file
tickTime=2000

initLimit=10

syncLimit=5

dataDir=/opt/zookeeper/data

dataLogDir=/opt/zookeeper/logs

clientPort=2183

server.1=192.168.11.101:2888:3888

server.2=192.168.11.102:2888:3888

server.3=192.168.11.103:2888:3888
