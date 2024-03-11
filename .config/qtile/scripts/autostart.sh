#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# xrandr 
xrandr --output HDMI-A-0 --mode 2560x1440 --rate 144.0
# vertical monitor setup
xrandr --output HDMI-A-1 --rotate right

# keyboard layout
setxkbmap -layout es

# starting utility applications at boot time
run nm-applet &
numlockx on &
udiskie -2 &
picom --config $HOME/.config/qtile/scripts/picom.conf &

# polkit and notifications
/usr/lib/xfce4/notifyd/xfce4-notifyd &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# starting user applications at boot time
nitrogen --restore &

