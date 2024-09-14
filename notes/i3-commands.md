# i3 Keyboard commands

- mod + q = kill
- mod + shift + q = kill
- ctrl + shift + esc = system monitor

## main apps
- mod+space = launcher - launcher.sh (rofi)
- mod + shift + d = dmenu
- mod1 + F2 = xfce4 appfinder collapsed
- mod1 + F3 = xfce4 app finder
- mod + F11 = rofi full
- mod + F12 = rofi small
- mod + return = terminal
- mod + t = alacritty
- mod + b = Brave
- mod + F4 = code
- mod = Shift = Enter = Thunar
- mod + ctrl + t = Thunderbird
- mod + mod1 + j = Create new jrnl note entry in floating window

## windows
- mod + shift + space = toggle floating window
- mod + r = resize mode - use arrow or jkl; keys to resize - esc to quit

### change focus
- mod + j or Left = focus left
- mod + k or Down = focus down
- mod + l or Up = focus up
- mod + semicolon or Right = focus right

### move focused window
- bindsym $mod+Shift+j or Left = move left
- bindsym $mod+Shift+k or Down = move down
- bindsym $mod+Shift+l or Up = move up
- bindsym $mod+Shift+semicolon or Right = move right

### split in horizontal orientation
- bindsym $mod+h split h

### split in vertical orientation
- bindsym $mod+v split v

### enter fullscreen mode for the focused container
- bindsym $mod+f fullscreen toggle

### change container layout (stacked, tabbed, toggle split)
- bindsym $mod+s layout stacking
- bindsym $mod+w layout tabbed
- bindsym $mod+e layout toggle split

### move focused container to workspace
- bindsym $mod+Shift+1 move container to workspace number $ws1
- bindsym $mod+Shift+2 move container to workspace number $ws2
- bindsym $mod+Shift+3 move container to workspace number $ws3
- bindsym $mod+Shift+4 move container to workspace number $ws4
- bindsym $mod+Shift+5 move container to workspace number $ws5
- bindsym $mod+Shift+6 move container to workspace number $ws6
- bindsym $mod+Shift+7 move container to workspace number $ws7
- bindsym $mod+Shift+8 move container to workspace number $ws8
- bindsym $mod+Shift+9 move container to workspace number $ws9
- bindsym $mod+Shift+0 move container to workspace number $ws10

