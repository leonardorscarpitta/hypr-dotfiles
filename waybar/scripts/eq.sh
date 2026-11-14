#!/usr/bin/env bash
bars=(▁ ▂ ▃ ▄ ▅ ▆ ▇)
status=""
tick=0

while true; do
    if [ $((tick % 5)) -eq 0 ]; then
        status=$(playerctl status 2>/dev/null)
    fi
    case "$status" in
        Playing)
            f=""
            for _ in 1 2 3 4; do f+="${bars[RANDOM % 7]}"; done
            printf '{"text":"%s","class":"playing"}\n' "$f"
            ;;
        Paused)
            printf '{"text":"▁▁▁▁","class":"paused"}\n'
            ;;
        *)
            printf '{"text":""}\n'
            ;;
    esac
    tick=$((tick + 1))
    sleep 0.2
done
