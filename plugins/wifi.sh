#!/bin/bash

SSID="$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}' | xargs networksetup -getairportnetwork | sed "s/Current Wi-Fi Network: //")"

#TODO: add speed & check on network disable
if [ "$SSID" = "" ]; then
  sketchybar --set $NAME label="Disconnected" icon=􀙈
else
  sketchybar --set $NAME label="$SSID (${CURR_TX}Mbps)" icon=􀙇
fi
