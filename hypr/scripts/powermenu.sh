#!/usr/bin/env bash
choice=$(printf '󰌾  Lock\n󰍃  Logout\n󰒲  Suspend\n󰜉  Reboot\n󰐥  Shutdown' |
    rofi -dmenu -i -p "power" -theme-str 'window { width: 300px; } listview { lines: 5; }')

case "$choice" in
    *Lock)     loginctl lock-session ;;
    *Logout)   hyprctl dispatch 'hl.dsp.exit()' ;;
    *Suspend)  systemctl suspend ;;
    *Reboot)   systemctl reboot ;;
    *Shutdown) systemctl poweroff ;;
esac
