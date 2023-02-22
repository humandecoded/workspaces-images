#!/bin/bash
set -e
set -x

cd /tmp/
git clone https://github.com/tracelabs/tlosint-vm.git
cd /tmp/tlosint-vm/
git checkout tom-no-tools

#### Setup Desktop Icons, backgrounds, etc ####
rsync -aviu overlays/tl-overlays/etc/ /etc/
rsync -aviu overlays/tl-overlays/usr/ /usr/

mv /etc/skel/Desktop/* $HOME/Desktop/

# get rid of kali default
apt update
apt remove kali-linux-default -y
apt autoremove -y

#install tl tools
sh $HOME/Desktop/install-tools.sh

apt-get install -y python3-pip

pip3 install --force-reinstall zope.event


rm -rf /var/lib/apt/lists/*

rm -rf /tmp/tlosint-live
