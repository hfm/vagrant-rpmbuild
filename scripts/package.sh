#!/bin/sh

set -e

osarch=`uname -i`
osmajor=$(cut -f3 -d' ' /etc/redhat-release | cut -f1 -d'.')

epel='epel-release-6-8.noarch.rpm'
case $osmajor in
    4)
        epel='epel-release-4-10.noarch.rpm'
        ;;
    5)
        epel='epel-release-5-4.noarch.rpm'
        ;;
    6)
        epel='epel-release-6-8.noarch.rpm'
        ;;
    *)
        echo "$osmajor Didn't match anything"
esac

# epel
curl -o /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL -L "http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/RPM-GPG-KEY-EPEL-$osmajor"
rpm -ivh "http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/$osmajor/$osarch/$epel"

# puppet
curl -o /etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs -L "http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs"
rpm -ivh "https://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-10.noarch.rpm"
yum install -y puppet

# chef
curl -kL https://www.opscode.com/chef/install.sh | bash
