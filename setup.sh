#!/bin/bash

target_dir="$HOME/.config"

#Install required packages
packages=(
    "git"
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
    "qt5-qtwayland"
    "qt6-qtwayland"
    "hyprpaper"
    "hyprlock"
    "firefox"
    "fontawesome-6-free-fonts"
    "python3-pip"
    "fastfetch"
    "mozilla-fira-sans-fonts"
    "fira-code-fonts"
    "wlogout"
    "python3-gobject"
    "gtk4"
    "sddm"
    "hyprpolkitagent"
    "gparted"
    "flatpak"
    "kitty"
    "fish"
)

sudo pacman -Syu
sudo pacman -S ${packages[@]}

flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpaks=(
    "com.brave.Browser"
    "com.stremio.Stremio"
    "org.mozilla.Thunderbird"
    "com.discordapp.Discord"
    "com.obsproject.Studio"
    "com.spotify.Client"
    "org.telegram.desktop"
    "org.videolan.VLC"
)

flatpak install ${flatpaks[@]}

# Copy config directories
if [ ! -d $target_dir ] ;then
    echo "$target_dir doesn't exist, creating..."
    mkdir $target_dir
fi

echo "Copying config files to $target_dir..."

rsync -avhp ./config/* $target_dir
