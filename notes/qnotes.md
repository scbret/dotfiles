# Linux Notes

## Arch - Notes

## X1 Carbon notes for Arch
- cp 20-backlight.conf to /usr/share/X11/xorg-confd/
- install intel-media-driver

## disable bell/beep in terminals
uncomment "set bell-style none" in /etc/inputrc

## wifi list/connect
nmtui = ncurses wifi config/connect
nmcli device wifi list
nmcli device wifi connect ssid password the-password
nmcli connection show  = list of connections and names
nmcli device disconnect ifname actual-interface-name
nmcli device = list of devices and state
nmcli radio wifi off = turn off wifi

### Install packages
- gvfs = automount usb
- stow = managing dotfiles
- mupdf & mupdf-tools = PDF viewer/editor
- evince = gnome PDF viewer
- bluez bluez-utils blueman
- xclip  - on X11
- wl-clipboard  - on Wayland
- cronie for cron jobs
- ncdu  for system file sizes
- below  - similar to htop
- fcitx5-configtool  - input config program

### Create list of installed packages - pacman
- pacman -Qm = installed locally from AUR
- pacman -Qqe | grep -v "$(pacman -Qqm)" > pacman.lst  
	-- reinstall from list
- cat pacman.lst | xargs pacman -S --needed --noconfirm
## pacman commands
- pacman -Syyu  - update/upgrade system
- pacman -S packagename  - install package
- pacman -Ss packagename  - search for packages or software type
- pacman -Si packagename  - search for info about a package before installing
- pacman -Qs packagename  - search for installed packages
- pacman -Qq  - list all installed packages by name only
- pacman -Qe  - list exclusively installed packages by name/version
- pacman -R packagename  - remove package
- pacman -Rns packagename  - remove package and unused dependencies
- pacman -Qdt  - list orphaned dependencies
- pacman -Rcs  - remove orphaned dependencies
- pacman -Qi packagename  - check package dependencies and config files

#### Polybar & Bluetooth
- https://git.ferano.io/JosephFerano/dotfiles/commit/97d7dcef98ec569510a0fabacab20857bbeb0a02
- https://github.com/msaitz/polybar-bluetooth

#### touchpad and mouse
- xorg-xinput
- https://wiki.archlinux.org/title/Xinput

#### Monitor
- xrandr --output eDP-1 --brightness 0.8 --gamma 1.0:1.0:1.0
- xrandr --output eDP-1 --brightness 0.8 --gamma 1.0:1.0:0.9  -makes it more yellow/less blue

### Arch you-tube
https://www.youtube.com/watch?v=L8TYWuNn_2c

### i3 keyboard shortcuts
- win+enter = open i3 compliant terminal
- win+shift+q = kill a window
- win+d = opens application launcher dmenu
- win+space = open rofi if configured
- win+s = stack windows
- win+w = tab windows
- win+e = tile windows
- win+f = fullscreen window
- win+# = switch to that workspace #
- win+shift+#  = moves window to that workspace #
- win+shift+space = toggles floating
- win+left click = drags floating window  
	(move & focus windows)
- cwin+shift+j = move window left
- win+j = focus left
- win+shift+k = move window down
- win+k = focus down
- win+shift+l = move window up
- win+l = focus up
- win+shift+; = move window right
- win+; = focus right

## stow notes
- stow folder-name = create the symlinks
- stow -D folder-name  = remove the symlinks

## Battery info from command line
- To display the battery percentage from the command line in Arch Linux, you can use several tools and commands:
    - Use the acpi command to get a quick overview of the battery status. For example, acpi -b will show the battery percentage and time remaining.
    - Use the upower command to get detailed information about the battery. For instance, upower -i /org/freedesktop/UPower/devices/battery_BAT0 will display a comprehensive report on the battery status.
    - Alternatively, you can directly read from the /sys/class/power_supply/BAT0 directory. For example, cat /sys/class/power_supply/BAT0/capacity will show the current battery percentage.
    - Another method is to use the battop tool, which provides a more detailed and formatted output of the battery status. You can install it from AUR or GitHub and run it in your terminal.
 
## Fedora notes

### Package management

- sudo dnf up   =  update/upgrade
- sudo dnf check-update   =  rarely needed - dnf updates its package cache automatically
- sudo dnf install package
- sudo dnf remove package
- sudo dnf autoremove
- sudo dnf search package
- sudo dnf info package
