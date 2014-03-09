#!/bin/sh

set -e

major=$(cut -f3 -d' ' /etc/redhat-release | cut -f1 -d'.')

dir='SRPMS'
[ major = 6 ] && dir='Source'

awk -v dir=$dir '{
ver=$3
print "[os-SRPM]\n" \
      "name=CentOS-" ver " - os SRPM\n" \
      "baseurl=http://vault.centos.org/" ver "/os/" dir "/\n" \
      "\n" \
      "[updates-SRPM]\n" \
      "name=CentOS-" ver " - updates SRPM\n" \
      "baseurl=http://vault.centos.org/" ver "/updates/" dir "/\n" \
      "\n" \
      "[extras-SRPM]\n" \
      "name=CentOS-" ver " - extras SRPM\n" \
      "baseurl=http://vault.centos.org/" ver "/extras/" dir "/\n"
}' /etc/redhat-release > /etc/yum.repos.d/CentOS-SRPM.repo
