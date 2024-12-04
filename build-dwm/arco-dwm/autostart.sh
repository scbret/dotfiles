#!/bin/bash

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}
#run "dex $HOME/.config/autostart/arcolinux-welcome-app.desktop"

#for virtualbox
#run xrandr --output Virtual-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal

#run xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#run xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#run xrandr --output eDP-1 --primary --mode 1368x768 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off
#run xrandr --output eDP1 --primary --mode 2560x1440 --pos 0x0 --rotate normal
#run xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#run xrandr --output DVI-I-0 --right-of HDMI-0 --auto
#run xrandr --output DVI-1 --right-of DVI-0 --auto
#run xrandr --output DVI-D-1 --right-of DVI-I-1 --auto
#run xrandr --output HDMI2 --right-of HDMI1 --auto
#autorandr horizontal

run "nm-applet"
run "xfce4-power-manager"
run "blueman-applet"
run "/usr/lib/xfce4/notifyd/xfce4-notifyd"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
picom -b  --config ~/.config/arco-dwm/picom.conf &
#run "numlockx on"
#run "volumeicon"
run slstatus &
sxhkd -c ~/.config/arco-dwm/sxhkd/sxhkdrc &
#run "conky -c $HOME/.config/arco-dwm/system-overview-mine"
#you can set wallpapers in themes as well
#feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &
feh --bg-fill $HOME/wallpaper/arco-wallpaper.jpg &
###feh --bg-fill $HOME/wallpaper/mountain-stream.jpg &
#wallpaper for other Arch based systems
#feh --bg-fill /usr/share/archlinux-tweak-tool/data/wallpaper/wallpaper.png &
#run applications from startup

#run "conky -c $HOME/.config/arco-dwm/system-keybinds"
run "conky -c $HOME/.config/arco-dwm/system-monitor"

#Auto mount OneDrive
sh -c "rclone --vfs-cache-mode writes mount \"onedrive\": ~/OneDrive"

#run "insync start"
#run "spotify"
#run "ckb-next -b"
#run "discord"
#run "telegram-desktop"
