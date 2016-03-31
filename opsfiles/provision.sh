#!/bin/bash

JDKFILE='jdk-8u45-linux-x64.rpm'

### install java
if [ -f ${SCRPATH}/opsfiles/jdk/${JDKFILE} ]; then
  ### when jdk exicts in local
  echo 'wget skip'
else
  ### when jdk does not exist in local
  cd /var/tmp/
  wget --no-check-certificate --no-cookies - --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm
#   cp -f ${JDKFILE} ${SCRPATH}/opsfiles/jdk/
  rpm -Uhv ${JDKFILE}
  ### /home/vagrantに保存される
fi


### get apache solr
cd /var/tmp
wget http://ftp.meisei-u.ac.jp/mirror/apache/dist/lucene/solr/5.5.0/solr-5.5.0.tgz
tar zxvf solr-5.5.0.tgz
cd solr-5.5.0/
bin/solr start

curl http://localhost:8983/solr/admin/ | head -n30
