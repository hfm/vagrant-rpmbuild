#!/bin/sh

yum -y clean all

rm -f RPM-GPG-KEY* *.rpm *.iso *.iso.?
rm -rf /tmp/vbox /home/vagrant/.vbox_version

rm -f /etc/udev/rules.d/70-persistent-net.rules
sed -i 's/^HWADDR.*$//' /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i 's/^UUID.*$//' /etc/sysconfig/network-scripts/ifcfg-eth0

dd if=/dev/zero of=/EMPTY bs=1M
rm -rf /EMPTY
sync
