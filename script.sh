#!/bin/bash

# IKR THE SCRIPT IS CRUDE and wont be making things comlicated

# updating packages and system
sudo pacman -Syu
sudo pacman -Syy

# installing packages
cd /tmp/dotfiles/
sudo pacman -S - < pkglist.txt
sudo pacman -S tmux zsh
sudo pacman -S kdecoration qt5-declarative qt5-x11extra cmake extra-cmake-modules
sudo pacman -S cmake

# installing sierrabreeze
# cd ..
# git clone https://github.com/kupiqu/SierraBreezeEnhanced
# cd SierraBreezeEnhanced
# mkdir build && cd build
# cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
# make
# sudo make install

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
	cd /tmp/dotfiles
else

# backing up and copying the dotfiles

mv ~/.zshrc ~/.zshrc.bak
mv ~/.vim ~/.vim.bak
mv ~/.vimrc ~/.vimrc.bak
mv ~/.local ~/.local.bak
mv ~/.config ~/.config.bak
mv ~/.bashrc ~/.bashrc.bak

cd /tmp/dotfiles/
cp .zshrc ~
tar xvf .vim.tar.gz
cp -r .vim ~
cp .tmux.conf ~
cp -r .local ~
cp -r .config ~
cp .bashrc ~
cp .vimrc ~

fi
