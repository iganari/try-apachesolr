#!/bin/bash

st -xe

: "install Zookeeper" && {
ZKR='zookeeper-3.4.8'
V_DIR='/srv/try-apachesolr'
Z_DIR='/opt/zookeeper'

cd /var/tmp
wget http://ftp.meisei-u.ac.jp/mirror/apache/dist/zookeeper/${ZKR}/${ZKR}.tar.gz
tar zxvf ${ZKR}.tar.gz
cp -ar ${ZKR} /opt/
ln -s /opt/${ZKR} ${Z_DIR}
cd ${Z_DIR}
# cp -a ./conf/zoo{_sample,}.cfg
# cat /srv/try-apachesolr/zoo.cfg >> /opt/zookeeper/conf/zoo.cfg 
ln -s ${V_DIR}/zoo.cfg ${Z_DIR}/conf/zoo.cfg
./bin/zkServer.sh start
}

: "launch Zookeeper id" && {
mkdir -p /tmp/zookeeper
hostname | sed 's/svr0//g' > /tmp/zookeeper/myid
}

: "restart zk" && {
cd ${Z_DIR}
./bin/zkServer.sh restart
}
