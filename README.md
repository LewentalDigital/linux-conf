## Packages
### Package manager
- bash-completions
- man
- git
- unzip
- neovim
- tmux
- xdg-user-dirs
<!--  -->
- hyprland
- xdg-desktop-portal-hyprland
- xdg-desktop-portal-gtk
- polkit-gnome
- wl-clipbloard
<!--  -->
- hyprpicker
- hyprpaper
- hypridle 
- hyprlock
- wlsunset
- waybar
- network-manager-applet
<!--  -->
- fprintd
- brightnessctl
- playerctl
<!--  -->
- ttf-jetbrains-mono
- ttf-nerd-fonts-symbols
- papirus-icon-theme
<!--  -->
- firefox
- xfce4-terminal
- nautilus # file manager
- ffmpegthumbnailer # thumbnails
- tumbler # thumbnails
- gvfs # trash management
- loupe # image viewer
- clapper # video player
- gst-libav # h264 video plugin
- papers # document viewer

### Unnecessary
- switcheroo # image conversion
- video-trimmer
- decibels # simple audio listener
- gnome-sound-recorder
- gnome-calculator
- snapshot # simple camera
- ocean-sound-theme
- pipewire-x11-bell


### makepkg
- yay

### yay
- visual-studio-code-bin
- pam-fprint-grosshack # simultaneous fingerprint and password authentication

### clone
- https://github.com/simtrami/posy-improved-cursor-linux # put in /usr/share/icons or /home/username/.icons


## etc configs

### /etc/pacman.conf
To enable colored pacman output and pretty print add these lines under **[options]** section
```
ILoveCandy
Color
```

### /etc/bluetooth/main.conf
To enable fast bluetooth connection (draws more battery!), add this line under **[General]** section
```
FastConnectable = true
```

### /etc/pam.d/system.local-login
To enable fingerprint login in terminal add the following lines
```
auth		sufficient  	pam_fprintd_grosshack.so
auth		sufficient  	pam_unix.so try_first_pass nullok
```

## GSETTINGS
```
gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"
gsettings set org.gnome.desktop.interface icon-theme Papirus
gsettings set org.gnome.desktop.interface cursor-theme Posy_Cursor_Black
gsettings set org.gnome.desktop.sound theme-name ocean
```