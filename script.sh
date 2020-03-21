#!/bin/bash

pacman -Syu
pacman -Syy
pacman -S - < pkglist.txt
git clone https://github.com/kupiqu/SierraBreezeEnhanced
cd SierraBreezeEnhanced
chmod +x install.sh
./install.sh
cd ..
cd dotfiles


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

pacman -S tmux

cp .zshrc ~
cp .vim.tar.gz ~
tar xvf .vim.tar.gz
cp .tmux.conf ~
cp -r .local ~
cp -r .config ~
cp .bashrc ~
