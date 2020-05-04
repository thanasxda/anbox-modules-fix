#!/bin/bash
sudo cd
sudo apt -f install dkms -y
mkdir -p ~/GIT
cd ~/GIT
git clone --depth=1 https://github.com/thanasxda/anbox-modules.git
cd anbox-modules
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
