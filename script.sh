#!/bin/bash

# IKR THE SCRIPT IS CRUDE and wont be making things comlicated


# updating packages and system
pacman -Syu
pacman -Syy

# installing packages
pacman -S - < pkglist.txt
pacman -S tmux

# installing sierrabreeze
cd ..
git clone https://github.com/kupiqu/SierraBreezeEnhanced
cd SierraBreezeEnhanced
chmod +x install.sh
./install.sh

# installing vmware tools
arg=$1
if [[ $arg == "vmware" ]]
then
	mkdir ~/docs/
	cd ~/docs
	git clone https://github.com/rasa/vmware-tools-patches.git
	cd vmware-tools-patches
	./patched-open-vm-tools.sh
	pacman -S asp
	asp checkout open-vm-tools
	cd open-vmtools/repos/community-x86_64/
	makepkg -s --asdeps
	sudo cp vm* /usr/lib/systemd/system
	sudo systemctl enable vmware-vmblock-fuse
	sudo systemctl enable vmtoolsd
else

# backing up and copying the dotfiles
cd ~

mv .zshrc .zshrc.bak
mv .vim .vim.bak
mv .vimrc .vimrc.bak
mv .local .local.bak
mv .config .config.bak
mv .bashrc .bashrc.bak

cp .zshrc ~
cp .vim.tar.gz ~
tar xvf .vim.tar.gz
cp .tmux.conf ~
cp -r .local ~
cp -r .config ~
cp .bashrc ~
cp .vimrc ~
