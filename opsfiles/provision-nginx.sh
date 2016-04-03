#!/bin/bash

set -xe

: "set & install nginx from repository" && {
rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
yum install -y nginx
service   nginx start
chkconfig nginx on
}
