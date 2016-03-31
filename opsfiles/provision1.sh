#!/bin/bash


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


: "get and install apache solr" && {
TMP_DIR='/var/tmp'
VERSION='5.5.0'

cd ${TMP_DIR}
wget http://ftp.meisei-u.ac.jp/mirror/apache/dist/lucene/solr/${VERSION}/solr-${VERSION}.tgz
tar zxvf ${TMP_DIR}/solr-${VERSION}.tgz
sh ${TMP_DIR}/solr-${VERSION}/bin/install_solr_service.sh solr-${VERSION}.tgz
}
