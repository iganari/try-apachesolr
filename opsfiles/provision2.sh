#!/bin/bash

: "install Zookeeper" && {
ZKR='zookeeper-3.4.8'

cd /var/tmp
wget http://ftp.meisei-u.ac.jp/mirror/apache/dist/zookeeper/zookeeper-3.4.8/${ZKR}.tar.gz
tar zxvf ${ZKR}.tar.gz
cp -ar ${ZKR} /opt/
ln -s /opt/${ZKR} /opt/zookeeper
cd /opt/zookeeper
cp -a ./conf/zoo{_sample,}.cfg
cat /srv/try-apachesolr/zoo.cfg >> /opt/zookeeper/conf/zoo.cfg 
./bin/zkServer.sh start
}

: "setting Zookeeper" && {
mkdir -p /tmp/zookeeper
hostname > /tmp/zookeeper/myid
}
