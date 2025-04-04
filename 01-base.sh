#!/bin/bash

# Prerequisites
sudo pacman -Syyu --noconfirm --needed base base-devel linux-firmware linux amd-ucode reflector
# Xorg
sudo pacman -S --noconfirm --needed xorg xf86-video-fbdev xf86-video-amdgpu
# Network
sudo pacman -S --noconfirm --needed wpa_supplicant networkmanager network-manager-applet
# Dm and greeter
sudo pacman -S --noconfirm --needed lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
# Desktop enviorment base apps
sudo pacman -S --noconfirm --needed firefox qtile picom rofi alacritty xfce4-terminal vim geany thunar ranger mpv
# Configuration and utils
sudo pacman -S --noconfirm --needed ristretto lxappearance nitrogen 7zip pavucontrol neofetch btop qalculate-gtk openssh yt-dlp dex fzf

# Other utils
sudo pacman -S --noconfirm --needed bash-completion xdg-user-dirs udiskie pacman-contrib numlockx dunst polkit polkit-gnome thunar-volman fuse gvfs gvfs-mtp cups rsync python-uv python-psutil python-dbus-next alsa-utils ntfs-3g
# Themes and fonts
sudo pacman -S --noconfirm arc-gtk-theme arc-icon-theme ttf-jetbrains-mono ttf-nerd-fonts-symbols

# GPU Drivers
sudo pacman -S --noconfirm vulkan-radeon lib32-vulkan-radeon

# Services
sudo systemctl enable lightdm
sudo systemctl enable NetworkManager
sudo systemctl enable fstrim.timer 
sudo systemctl enable reflector.timer
sudo systemctl enable cups.service
sudo systemctl enable sshd

# Default directories
xdg-user-dirs-update
xdg-settings set default-web-browser firefox.desktop
# Config files
cp -Rf .config ~/
cp -Rf wallpaper ~/Pictures
cp -f .bashrc ~/

# AUR (paru)
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si --noconfirm



# Reboot 
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
