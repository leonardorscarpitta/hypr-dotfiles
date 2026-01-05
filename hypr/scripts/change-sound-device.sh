#!/bin/bash

SINK_A=46 # HyperX
SINK_B=56 # Built-in

CURRENT_SINK=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | awk '/id / {print $2; exit}' | tr -d ',')

if [ "$CURRENT_SINK" = "$SINK_A" ]; then
  wpctl set-default "$SINK_B"
  notify-send "Áudio" "Saída: Built-in Audio"
else
  wpctl set-default "$SINK_A"
  notify-send "Áudio" "Saída: HyperX 7.1"
fi
