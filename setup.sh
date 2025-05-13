#!/bin/bash

target_dir="$HOME/.config"

#Install required packages
packages=(
    "base-devel"
    "rsync"
    "wget"
    "unzip"
    "hyprland"
    "waybar"
    "rofi-wayland"
    "dunst"
    "swaync"
    "dolphin"
    "kwrite"
    "xdg-desktop-portal-hyprland"
    "qt5-wayland"
    "qt6-wayland"
    "hyprpaper"
    "hyprlock"
    "firefox"
    "ttf-font-awesome"
    "fastfetch"
    "ttf-fira-sans"
    "ttf-firacode-nerd"
    "fuse2"
    "python-gobject"
    "gtk4"
    "libadwaita"
    "jq"
    "hyprpolkitagent"
    "xdotool"
    "brightnessctl"
    "networkmanager"
    "wireplumber"
    "flatpak"
    "kitty"
    "fish"
)

sudo pacman -Sy
echo
sudo pacman --noconfirm -S "${packages[@]}";

#Install yay if needed

if sudo pacman -Qs yay > /dev/null ; then
    echo "yay is already installed!"
else
    echo "yay is not installed. Will be installed now!"
    _installPackagesPacman "base-devel"
    SCRIPT=$(realpath "$0")
    temp_path=$(dirname "$SCRIPT")
    echo $temp_path
    git clone https://aur.archlinux.org/yay-git.git ~/yay-git
    cd ~/yay-git
    makepkg -si
    cd $temp_path
    echo "yay has been installed successfully."
fi

sudo yay --noconfirm -S wlogout

# Copy config directories
if [ ! -d $target_dir ] ;then
    echo "$target_dir doesn't exist, creating..."
    mkdir $target_dir
fi

echo "Copying config files to $target_dir..."

rsync -avhp ./config/* $target_dir
