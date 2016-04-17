#!/bin/bash


java() {

  : "DEFINE" && {
  JDKFILE='jdk-8u45-linux-x64.rpm'
  } 
  
  
  : "install java" && {
  if [ -f ${SCRPATH}/opsfiles/jdk/${JDKFILE} ]; then
    ### when jdk exicts in local
    echo 'wget skip' ### when jdk exicts in local
  else
    ### when jdk does not exist in local
    cd /var/tmp/
    wget --no-check-certificate --no-cookies - --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/${JDKFILE}
    rpm -Uhv ${JDKFILE}
    ### /home/vagrantに保存される
  fi
  }
  
  : "install basic command" && {
  yum install -y vim-enhanced telnet nc lsof
  }
  
  
  : "setting date" && {
  rm -rf /etc/localtime
  ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
  }
}

zk() {
  
  : "install Zookeeper" && {
  ZKR='zookeeper-3.4.8'
  V_DIR='/srv/try-apachesolr'
  Z_DIR='/opt/zookeeper'
  
  cd /var/tmp
  # wget http://ftp.meisei-u.ac.jp/mirror/apache/dist/zookeeper/${ZKR}/${ZKR}.tar.gz
  wget http://ftp.riken.jp/net/apache/zookeeper/${ZKR}/${ZKR}.tar.gz
  tar zxvf ${ZKR}.tar.gz
  
  cp -ar ${ZKR} /opt/
  ln -s /opt/${ZKR} ${Z_DIR}
  cd ${Z_DIR}
  ln -s ${V_DIR}/template/zookeeper/conf/zoo.cfg ${Z_DIR}/conf/zoo.cfg
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
}

solr() {
  
  : "get and install apache solr" && {
  TMP_DIR='/var/tmp'
  VERSION='5.5.0'
  
  cd ${TMP_DIR}
  # wget http://ftp.meisei-u.ac.jp/mirror/apache/dist/lucene/solr/${VERSION}/solr-${VERSION}.tgz
  wget http://ftp.riken.jp/net/apache/lucene/solr/${VERSION}/solr-${VERSION}.tgz
  tar zxvf ${TMP_DIR}/solr-${VERSION}.tgz
  sh ${TMP_DIR}/solr-${VERSION}/bin/install_solr_service.sh solr-${VERSION}.tgz
  ln -s ${V_DIR}/template/solr/etc/solr.conf  /etc/solr.conf
  service solr restart
  }
}

nginx() {

  : "set & install nginx from repository" && {
  rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
  yum install -y nginx
  service   nginx start
  chkconfig nginx on
  }
}

######################################

: "init provision" & {
java
zk
solr
}
