#!/bin/bash
# xtables-addons-2.14 is needed because AMI2 is based on kernel 3.x....4.14, xtables 3.x requires min kernel 4.15
yum install gcc-c++ make automake kernel-devel-`uname -r` wget unzip iptables-devel perl-Text-CSV_XS

wget http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons/xtables-addons-2.14.tar.xz
tar xf xtables-addons-2.14.tar.xz
cd xtables-addons-2.14
./configure
sed -i '/xt_TARPIT.o$/s/^/#/' extensions/Kbuild
make
sudo make install


#Allow SeLinux from loading modules:
sudo chcon -h system_u:object_r:bin_t:s0  /lib/modules/$(uname -r)/extra/*.ko
sudo chcon -h lib_t:object_r:bin_t:s0 /lib64/xtables/*.so

sudo mkdir -p /usr/share/xt_geoip

cd geoip
vim xt_geoip_d

