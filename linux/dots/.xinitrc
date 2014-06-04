#!/bin/sh

# Turn off screensaver functions, system bell and enable energy star
# features.
xset -b +dpms s off

# Setup font path.
xset +fp /usr/share/fonts/local
xset fp rehash

# Load modified keymap.
xmodmap ~/.Xmodmap

# Set background color and wallpaper.
xsetroot -solid '#666666'

# Start MPD daemon.
mpd &

# start urxvt terminal daemon
/usr/bin/urxvtd -q -o -f &

# Finally start xmonad wrapped in a call to ssh-agent.
exec ssh-agent /usr/bin/xmonad
