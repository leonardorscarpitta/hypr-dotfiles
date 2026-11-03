#!/usr/bin/env bash
step=40
win=$(hyprctl activewindow -j)
class=$(jq -r '.class // empty' <<<"$win")
w=$(jq '.size[0]' <<<"$win"); h=$(jq '.size[1]' <<<"$win")

case "$1" in
    right) dx=$step;  dy=0 ;;
    left)  dx=-$step; dy=0 ;;
    down)  dx=0;      dy=$step ;;
    up)    dx=0;      dy=-$step ;;
    *) exit 1 ;;
esac

if [ "$class" = "mpv" ] && [ "$(jq '.floating' <<<"$win")" = "true" ] && [ "$w" -gt 0 ] && [ "$h" -gt 0 ]; then
    if [ "$dx" -ne 0 ]; then
        nw=$((w + dx)); nh=$(( (nw * h + w / 2) / w ))
    else
        nh=$((h + dy)); nw=$(( (nh * w + h / 2) / h ))
    fi
    [ "$nw" -lt 160 ] && exit 0
    hyprctl dispatch "hl.dsp.window.resize({ x = $nw, y = $nh })" >/dev/null
else
    hyprctl dispatch "hl.dsp.window.resize({ x = $dx, y = $dy, relative = true })" >/dev/null
fi
