## Packages
### Package manager
- linux-firmware # maybe preinstalled by default?
- fwupd
- bash-completions
- man
- git
- unzip
- neovim
- tmux
- xdg-user-dirs
- libsecret
- gnome-keyring
- xorg-xhost
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
- hyprshot
- wlsunset
- waybar
- network-manager-applet
<!--  -->
- upower
- fprintd
- bluez
- bluez-utils
- brightnessctl
- playerctl
- batsignal
- wl-clip-persist
<!--  -->
- ttf-jetbrains-mono
- ttf-nerd-fonts-symbols
- papirus-icon-theme
<!--  -->
- firefox
- xfce4-terminal
- pavucontrol
- blueman
- resources
- nautilus # file manager
- ffmpegthumbnailer # thumbnails
- tumbler # thumbnails
- gvfs # trash management
- loupe # image viewer
- clapper # video player
- gst-libav # h264 video plugin
- papers # document viewer
- kdeconnect
- tesseract-eng # ocr
- tesseract-ita
- gnome-bluetooth-3.0 ?????
- python-jinja
- dart-sass

### Unnecessary
- switcheroo # image conversion
- video-trimmer
- decibels # simple audio listener
- gnome-sound-recorder
- gnome-calculator
- font-manager
- gnome-clocks
- snapshot # simple camera
- ocean-sound-theme
- pipewire-x11-bell
- viu
- bat
- gparted
- pdfarranger
- baobab
- sushi # instant preview for gnome files
- gradia # screeenshot annotator 
- gnome-boxes

### AUDIO
- easyeffects
- lmms
- calf
- lsp-plugins-lv2


### Cool
- caligula
- pastel
- astroterm
- graphs

### makepkg
- yay

### yay
- visual-studio-code-bin
- pam-fprint-grosshack # simultaneous fingerprint and password authentication
- lunacy-bin
- hyprshell
- goignis
- gpu-screen-recorder ???
- python-ignis-git
- python-materialyoucolor
- bibata-cursor-theme

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
To enable fingerprint login in terminal add the following lines at the top
```
auth		sufficient  	pam_fprintd_grosshack.so
```

You can also modify other files in /etc/pam.d/{login,su,sudo,gdm,lightdm} in the same way.
For example /etc/pam.d/polkit-1 for polkit based authentication (GNOME & many other desktop environments). If /etc/pam.d/polkit-1 does not exist, copy it from /usr/lib/pam.d/polkit-1

## GSETTINGS
```
gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"
gsettings set org.gnome.desktop.interface icon-theme Papirus
gsettings set org.gnome.desktop.interface cursor-theme Posy_Cursor_Black
gsettings set org.gnome.desktop.sound theme-name ocean
gsettings set org.gnome.nautilus.preferences default-sort-order 'type'
```

## RUN COMMANDS
To allow gparted to start
```
xhost si:localuser:root
```