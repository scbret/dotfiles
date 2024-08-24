# Linux Notes

## Arch - i3W Notes

### Install packages
gvfs = automount usb
stow = managing dotfiles
mupdf & mupdf-tools = PDF viewer/editor
evince = gnome PDF viewer
bluez bluez-utils blueman

#### Polybar & Bluetooth
https://git.ferano.io/JosephFerano/dotfiles/commit/97d7dcef98ec569510a0fabacab20857bbeb0a02
https://github.com/msaitz/polybar-bluetooth

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
