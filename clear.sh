#!/usr/bin/env bash

if [[ -z "$TMUX" ]]; then
    echo "Error: not running inside tmux"
    exit 1
fi

first_window=$(tmux list-windows -F '#{window_id}' | head -n 1)

while IFS= read -r window_id; do
    [[ "$window_id" == "$first_window" ]] && continue
    tmux kill-window -t "$window_id"
done < <(tmux list-windows -F '#{window_id}')
