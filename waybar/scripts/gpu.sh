#!/usr/bin/env bash
f=$(ls /sys/class/drm/card*/device/gpu_busy_percent 2>/dev/null | head -1)
if [[ -n $f ]]; then
    usage=$(<"$f")
elif command -v nvidia-smi >/dev/null; then
    usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | head -1)
else
    exit 0
fi

class=normal
(( usage >= 90 )) && class=critical
(( usage >= 70 && usage < 90 )) && class=warning
printf '{"text":"%s","percentage":%s,"tooltip":"GPU %s%%","class":"%s"}\n' "$usage" "$usage" "$usage" "$class"
