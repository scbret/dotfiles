# Linux Notes

## Arch - i3W Notes

## X1 Carbon notes for Arch
cp 20-backlight.conf to /usr/share/X11/xorg-confd/
install intel-media-driver

## disable bell/beep in terminals
uncomment "set bell-style none" in /etc/inputrc

### Install packages
gvfs = automount usb
stow = managing dotfiles
mupdf & mupdf-tools = PDF viewer/editor
evince = gnome PDF viewer
bluez bluez-utils blueman

### Create list of installed packages - pacman
pacman -Qm = installed locally from AUR
pacman -Qqe | grep -v "$(pacman -Qqm)" > pacman.lst
-- reinstall from list
cat pacman.lst | xargs pacman -S --needed --noconfirm
## pacman commands
pacman -Syyu  - update/upgrade system
pacman -S packagename  - install package
pacman -Ss packagename  - search for packages or software type
pacman -Si packagename  - search for info about a package before installing
pacman -Qs packagename  - search for installed packages
pacman -R packagename  - remove package
pacman -Rns packagename  - remove package and unused dependencies
pacman -Qdt  - list orphaned dependencies
pacman -Rcs  - remove orphaned dependencies
pacman -Qi packagename  - check package dependencies and config files

#### Polybar & Bluetooth
https://git.ferano.io/JosephFerano/dotfiles/commit/97d7dcef98ec569510a0fabacab20857bbeb0a02
https://github.com/msaitz/polybar-bluetooth

#### touchpad and mouse
xorg-xinput
https://wiki.archlinux.org/title/Xinput

### Arch you-tube
https://www.youtube.com/watch?v=L8TYWuNn_2c

### i3 keyboard shortcuts
win+enter = open i3 compliant terminal
win+shift+q = kill a window
win+d = opens application launcher dmenu
win+space = open rofi if configured
win+s = stack windows
win+w = tab windows
win+e = tile windows
win+f = fullscreen window
win+# = switch to that workspace #
win+shift+#  = moves window to that workspace #
win+shift+space = toggles floating
win+left click = drags floating window
(move & focus windows)
win+shift+j = move window left
win+j = focus left
win+shift+k = move window down
win+k = focus down
win+shift+l = move window up
win+l = focus up
win+shift+; = move window right
win+; = focus right

## stow notes
 stow folder-name = create the symlinks
 stow -D folder-name  = remove the symlinks
 
## Fedora notes

### Package management

- sudo dnf up   =  update/upgrade
- sudo dnf check-update   =  rarely needed - dnf updates its package cache automatically
- sudo dnf install package
- sudo dnf remove package
- sudo dnf autoremove
- sudo dnf search package
- sudo dnf info package
