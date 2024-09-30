if [ "$(tty)" = "/dev/tty1" ];then
  exec Hyprland
  #exec /usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland
fi
