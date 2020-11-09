#!/bin/bash

error() { clear; printf "ERROR:\\n%s\\n" "$1"; exit;}

welcomemsg() { \
	dialog --title "Welcome!" --msgbox "Welcome to Anonimbus's dotfiles installtion script\\nThis script will automatically install my dotfiles which I use in my main machine.\\n\\n-Tarush" 10 60
	}

installpkg(){ pacman --noconfirm --needed -S "$1" >/dev/null 2>&1 ;}

vmwarechoice() { \
	OPTIONS=(1 "YES"
	         2 "NO")
	vmware=$(dialog --clear \
 	 	        --backtitle "vmware-tools" \
                	--title "installtion choice" \
               	 	--menu "Do you wanto to install vmware tools or want to go ahead to install dotfiles?" \
                	15 40 4 \
                	"${OPTIONS[@]}" \
                	2>&1 >/dev/tty)

	clear
	case $vmware in
	        1)
	            vmwareinstall
	            ;;
	        2)
	            dotfiles
	            ;;
	esac
}

vmwareinstall() { \
	installpkg git
	installpkg nano
	installpkg vim
}

welcomemsg
vmwarechoice
