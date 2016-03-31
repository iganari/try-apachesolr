#!/bin/bash

cd /var/tmp
wget http://ftp.meisei-u.ac.jp/mirror/apache/dist/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz
tar zxvf zookeeper-3.4.8.tar.gz
ln -s /var/tmp/zookeeper-3.4.8 /var/lib/zookeeper
cd /var/lib/zookeeper
cp -a ./conf/zoo{_sample,}.cfg
cat /srv/try-apachesolr/zoo.cfg >> /var/lib/zookeeper/conf/zoo.cfg 
./bin/zkServer.sh start

mkdir -p /tmp/zookeeper
hostname > /tmp/zookeeper/myid

