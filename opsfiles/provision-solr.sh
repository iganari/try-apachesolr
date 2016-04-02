#!/bin/bash

set -xe

: "get and install apache solr" && {
TMP_DIR='/var/tmp'
VERSION='5.5.0'

cd ${TMP_DIR}
wget http://ftp.meisei-u.ac.jp/mirror/apache/dist/lucene/solr/${VERSION}/solr-${VERSION}.tgz
tar zxvf ${TMP_DIR}/solr-${VERSION}.tgz
sh ${TMP_DIR}/solr-${VERSION}/bin/install_solr_service.sh solr-${VERSION}.tgz
}
