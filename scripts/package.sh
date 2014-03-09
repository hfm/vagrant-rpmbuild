#!/bin/sh

set -e

osarch=`uname -i`
osmajor=$(cut -f3 -d' ' /etc/redhat-release | cut -f1 -d'.')

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
curl -OL 'http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/RPM-GPG-KEY-EPEL'
rpm --import -v 'RPM-GPG-KEY-EPEL'
curl -OL "http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/$osmajor/$osarch/$epel"
rpm -K $epel
rpm -ivh $epel

# puppet
if [ $osmajor != 4 ]; then
    curl -OL 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs'
    rpm --import -v 'RPM-GPG-KEY-puppetlabs'
    curl -OL "https://yum.puppetlabs.com/el/$osmajor/products/$osarch/puppetlabs-release-$osmajor-10.noarch.rpm"
    rpm -K "puppetlabs-release-$osmajor-10.noarch.rpm"
    rpm -ivh "puppetlabs-release-$osmajor-10.noarch.rpm"
fi
yum install -y puppet

# chef
curl -kL 'https://www.opscode.com/chef/install.sh' | bash
