#!/bin/sh

PATH=/usr/local/bin:$PATH

packer build packer/packer4_32bit.json
packer build packer/packer4_64bit.json
packer build packer/packer5_32bit.json
packer build packer/packer5_64bit.json
packer build packer/packer6_32bit.json
packer build packer/packer6_64bit.json
