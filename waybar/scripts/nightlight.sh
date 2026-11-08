#!/usr/bin/env bash
TEMP=4500

running() { pgrep -x hyprsunset >/dev/null; }
is_on() { running && [ "$(hyprctl hyprsunset identity get 2>/dev/null)" = "false" ]; }

if [ "$1" = "toggle" ]; then
  if ! running; then
    setsid -f hyprsunset -i >/dev/null 2>&1
    for _ in 1 2 3 4 5 6 7 8 9 10; do
      sleep 0.2
      [ -S "$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.hyprsunset.sock" ] && break
    done
  fi
  if is_on; then
    hyprctl hyprsunset identity >/dev/null
  else
    hyprctl hyprsunset temperature "$TEMP" >/dev/null
  fi
  pkill -RTMIN+8 waybar
  exit 0
fi

if is_on; then
  printf '{"text":"󰽥","tooltip":"Night light on · %sK\\nclick to turn off","class":"on"}\n' "$TEMP"
else
  printf '{"text":"󰖙","tooltip":"Night light off\\nclick for warm colors (%sK)","class":"off"}\n' "$TEMP"
fi
