#!/bin/bash
### set github dir
git=~/GIT
dir=linux54
sudo apt -f install dkms -y
mkdir -p $git
cd $git && sudo rm -rf $dir
git clone --depth=1 https://gitlab.com/gobudgie/anbox-modules $dir
cd $dir
sudo cp anbox.conf /etc/modules-load.d/
sudo cp 99-anbox.rules /lib/udev/rules.d/
sudo cp -rT ashmem /usr/src/anbox-ashmem-1
sudo cp -rT binder /usr/src/anbox-binder-1
sudo dkms install anbox-ashmem/1
sudo dkms install anbox-binder/1
sudo modprobe ashmem_linux
sudo modprobe binder_linux
lsmod | grep -e ashmem_linux -e binder_linux
ls -alh /dev/binder /dev/ashmem
echo DONE...
