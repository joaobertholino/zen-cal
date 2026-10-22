#!/usr/bin/env bash
# Alterna o calendário aberto pelo relógio, sem usar a sessão tmux do terminal.
set -euo pipefail

mapfile -t calendars < <(pgrep -u "$UID" -x zen-cal || true)
if (( ${#calendars[@]} )); then
    kill -TERM -- "${calendars[@]}"
    exit 0
fi

binary="$HOME/.local/bin/zen-cal"
if [[ ! -x "$binary" ]]; then
    notify-send --app-name=Calendário 'zen-cal não instalado' 'Instale o executável em ~/.local/bin/zen-cal.'
    exit 1
fi

exec alacritty --class TUI.zencal --title 'Calendário' \
    -o 'window.padding.x=8' -o 'window.padding.y=6' \
    -o 'window.dimensions.columns=38' -o 'window.dimensions.lines=14' \
    -e "$binary"
