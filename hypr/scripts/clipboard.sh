#!/usr/bin/env bash
cliphist list | rofi -dmenu -i -p "clip" -display-columns 2 | cliphist decode | wl-copy
