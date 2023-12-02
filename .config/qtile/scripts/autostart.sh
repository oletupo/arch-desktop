#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#XRandr examples

#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off

xrandr --output HDMI-1 --mode 2560x1440 --rate 144.0
# vertical monitor setup
xrandr --output HDMI-A-1 --rotate right
# keyboard layout
setxkbmap -layout es

#IN BETA PHASE
#start sxhkd to replace Qtile native key-bindings
#run sxhkd -c ~/.config/qtile/sxhkd/sxhkdrc &

#starting utility applications at boot time
run nm-applet &
#run pamac-tray &
#run xfce4-power-manager &
numlockx on &
udiskie -2 &
#blueberry-tray &
picom --config $HOME/.config/qtile/scripts/picom.conf &
# polkit and notifications
/usr/lib/xfce-polkit/xfce-polkit &
/usr/lib/xfce4/notifyd/xfce4-notifyd &

#starting user applications at boot time
#run volumeicon &
nitrogen --restore &
#run firefox &
#run thunar &
#run dropbox &
