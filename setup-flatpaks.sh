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

flatpak install --user "${flatpaks[@]}";
