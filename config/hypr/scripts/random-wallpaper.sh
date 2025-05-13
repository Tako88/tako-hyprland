#!/bin/bash

path="$HOME/.config/hypr/wallpapers"

new_wallpaper=$(find $path -type f | shuf -n 1)

hyprctl hyprpaper preload $new_wallpaper
hyprctl hyprpaper wallpaper ",$new_wallpaper"
