# DOCKER-VERSION 1.6.1
# VERSION        1.0

FROM ubuntu:trusty
MAINTAINER wangpeng6421 <wangpeng6421@hotmail.com>

ENV ZK_HOME /opt/zookeeper
ENV ZK_VERSION 3.4.6

RUN apt-get update && apt-get install -y openjdk-7-jre-headless wget
RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-${ZK_VERSION}/zookeeper-${ZK_VERSION}.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-${ZK_VERSION} /opt/zookeeper \
    && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg \

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN sed  -i "s|/tmp/zookeeper|$ZK_HOME/data|g" $ZK_HOME/conf/zoo.cfg; mkdir $ZK_HOME/data

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/opt/zookeeper/data"]

ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]

