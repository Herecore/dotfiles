### Variables
    ### Logo key
    set $mod Mod4

    ### Terminal
    set $term alacritty

    ### Launcher
    for_window [app_id="^launcher$"] floating enable, sticky enable, resize set 30 ppt 60 ppt, border pixel 10
    set $menu exec $term --class=launcher -e sway-launcher-desktop
    
    ### Screenshot
    set $screenshot grim - | wl-copy
    set $screenshot-region grim -g "$(slurp)" - | wl-copy
    
    ### File manager
    set $filemgr nemo

    ### Browser
    set $browser waterfox-g4

    ### Password manager
    set $passmgr keepassxc

    ### Make russian layout work
    set $mybind bindsym --to-code

    ### Home row direction keys, like vim, but for colemak layout
    set $Left n
    set $Down e
    set $Up u
    set $Right i

### Output configuration
    output "DP-2" mode 1920x1080@144.001Hz pos 0,0
    output "*" adaptive_sync on

### Enable notifications
    exec swaync

### Enable auth agent
    exec "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"

### Theming
    ### Gaps and borders
    default_border pixel 2
    smart_borders on
    smart_gaps on
    gaps inner 10px
    # Colors
    client.focused              #ebcb8b #ebcb8b #eceff4 #ebcb8b
    client.focused_tab_title    #ebcb8b #ebcb8b #eceff4 #ebcb8b
    client.focused_inactive     #4c566a #4c566a #d8dee9 #ebcb8b
    client.unfocused            #4c566a #4c566a #d8dee9 #ebcb8b
    client.urgent               #bf616a #bf616a #eceff4 #ebcb8b

    ### Wallpaper
    # Random wallpaper on boot
    exec swaybg -i $(find .config/sway/wallpaper/. -type f | shuf -n1) -m fill

    ### Cursor 
    # Apply cursor theme for sway
    seat seat0 xcursor_theme 'volantes_cursors' 32
    
    # Read Xresources to apply custom cursor in Xwayland apps
    exec xrdb -load "$HOME/.config/X11/xresources"
    
    ### Status Bar:
    bar {
        swaybar_command waybar
    }

    ### Font settings:
    font pango:Hack 14px

    ### Applying GTK themes
    set $gnome-schema org.gnome.desktop.interface
    exec_always {
        gsettings set $gnome-schema gtk-theme 'Nordic'
        gsettings set $gnome-schema icon-theme 'Papirus-Dark'
        gsettings set $gnome-schema cursor-theme 'volantes_cursors'
        gsettings set $gnome-schema cursor-size 32
    }

### Input configuration
    ### Keyboard layout
    input * {
        xkb_layout us(colemak),ru
        xkb_options grp:caps_toggle
        xkb_numlock enable
    }

    ### Supersonic speed in console
    input 1133:49960:Logitech_USB_Keyboard repeat_delay 300
    input 1133:49960:Logitech_USB_Keyboard repeat_rate 60

    ### Disable mouse acceleration
    input 1133:49298:Logitech_G102_LIGHTSYNC_Gaming_Mouse accel_profile flat 
    
    ### Mouse sensitivity
    input 1133:49298:Logitech_G102_LIGHTSYNC_Gaming_Mouse pointer_accel -0.75

### Key bindings
    ### Start a terminal
    $mybind $mod+Return exec $term

    ### Start a browser
    $mybind $mod+b exec $browser
    
    ### Start a file manager
    $mybind $mod+m exec $filemgr

    ### Start a password manager
    $mybind $mod+k exec $passmgr

    ### Take a screenshot and copy to clipboard
    $mybind Print exec $screenshot
    $mybind $mod+Print exec $screenshot-region

    ### Start your launcher
    $mybind $mod+s exec $menu
    
    ### Kill focused window
    $mybind $mod+Shift+q kill
    
    ### Reload the configuration file
    $mybind $mod+Shift+c reload
    
    ### Move floating windows holding down $mod
    floating_modifier $mod normal

    ### Audio keybinds
    $mybind XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
    $mybind XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%
    $mybind XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle

### Navigation
    ### Move your focus around first 4 is for keyboard arrows, latter are for vim keys
    $mybind $mod+Left focus left
    $mybind $mod+Down focus down
    $mybind $mod+Up focus up
    $mybind $mod+Right focus right
    
    $mybind $mod+$Left focus left
    $mybind $mod+$Down focus down
    $mybind $mod+$Up focus up
    $mybind $mod+$Right focus right

    ### Move the focused window with the same, but add Shift
    $mybind $mod+Shift+Left move left
    $mybind $mod+Shift+Down move down
    $mybind $mod+Shift+Up move up
    $mybind $mod+Shift+Right move right

    $mybind $mod+Shift+$Left move left
    $mybind $mod+Shift+$Down move down
    $mybind $mod+Shift+$Up move up
    $mybind $mod+Shift+$Right move right

### Workspaces
    ### Switch to workspace
    $mybind $mod+1 workspace number 1
    $mybind $mod+2 workspace number 2
    $mybind $mod+3 workspace number 3
    $mybind $mod+4 workspace number 4
    $mybind $mod+5 workspace number 5
    $mybind $mod+6 workspace number 6
    $mybind $mod+7 workspace number 7
    $mybind $mod+8 workspace number 8
    $mybind $mod+9 workspace number 9
    $mybind $mod+0 workspace number 10
    
    ### Move focused container to workspace
    $mybind $mod+Shift+1 move container to workspace number 1
    $mybind $mod+Shift+2 move container to workspace number 2
    $mybind $mod+Shift+3 move container to workspace number 3
    $mybind $mod+Shift+4 move container to workspace number 4
    $mybind $mod+Shift+5 move container to workspace number 5
    $mybind $mod+Shift+6 move container to workspace number 6
    $mybind $mod+Shift+7 move container to workspace number 7
    $mybind $mod+Shift+8 move container to workspace number 8
    $mybind $mod+Shift+9 move container to workspace number 9
    $mybind $mod+Shift+0 move container to workspace number 10

### Resizing containers
    mode "resize" {
        $mybind Left resize shrink width 10px
        $mybind Down resize grow height 10px
        $mybind Up resize shrink height 10px
        $mybind Right resize grow width 10px

        $mybind $Left resize shrink width 10px
        $mybind $Down resize grow height 10px
        $mybind $Up resize shrink height 10px
        $mybind $Right resize grow width 10px

        $mybind Return mode "default"
        $mybind Escape mode "default"
    }
    $mybind $mod+r mode "resize"

### Layout
    ### Make the focused container fullscreen
    $mybind $mod+f fullscreen

    ### Toggle the focused container between tiling and floating mode
    $mybind $mod+Shift+space floating toggle

    ### Swap focus between the tiling area and the floating area
    $mybind $mod+space focus mode_toggle

### Window rules
    for_window [title="Friends List"] floating enable
    for_window [title="Origin"] floating enable

include /etc/sway/config.d/*
