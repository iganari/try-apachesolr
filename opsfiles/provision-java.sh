#!/bin/bash

# set -xe

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
