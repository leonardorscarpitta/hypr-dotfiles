#!/bin/bash

choice=$(printf "⏻  Shutdown\n  Reboot\n󰍃  Suspend\n󰌾  Lock" |
  rofi -dmenu -p "Power" \
    -theme-str 'element-text { font: "JetBrains Mono 12"; }
                listview { lines: 4; }
                element { padding: 16px; }
                window { width: 25%; }')

case "$choice" in
*Shutdown*) systemctl poweroff ;;
*Reboot*) systemctl reboot ;;
*Suspend*) hyprctl dispatch exit ;;
*Lock*) hyprlock ;;
esac
