sudo snap install anbox --edge --devmode && git clone --depth=1 https://github.com/thanasxda/anbox-modules-fix.git && cd anbox-modules-fix && ./anbox_modules_fix.sh

###### if problem persists solutions are:
wget https://launchpad.net/~teejee2008/+archive/ubuntu/ppa/+files/ukuu_18.9.3-0~201902031503~ubuntu18.04.1_amd64.deb && sudo dpkg -i ukuu* && sudo apt -f install -y && sudo apt --fix-broken install -y && rm -rf ukuu* 
###### start menu>system>ukuu kernel update utility> install latest mainline kernel. (non -rc release support only) reboot and rerun anbox-modules-fix.sh and the issue should be solved. 

###### if you build your own kernel enable underneath features within the defconfig for anbox support:
CONFIG_ANDROID=y
CONFIG_ANDROID_BINDER_IPC=y
CONFIG_ASHMEM=y
CONFIG_KVM=y
CONFIG_KVM_INTEL=m
CONFIG_KVM_AMD=m

###### optionally use mine (comes with support):
https://github.com/thanasxda/thanas-x86-64-kernel.git
./build.sh - automated install.
###### personal ubuntu build environment:
https//github.com/thanasxda/basic-linux-setup/blob/master/setup.sh



